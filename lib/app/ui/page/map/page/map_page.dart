import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:library_attend_check/app/data/repository/map_repository.dart';
import 'package:library_attend_check/app/ui/page/map/widget/choolCheckButton.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool choolCheckDone = false;
  GoogleMapController? mapController;

  // latitude - 위도, longitude - 경도

  // 37.5974538!4d126.8917157/
  static final LatLng companyLatLng =
  // LatLng(37.56393853398269, 126.93694121523816); // 연세대학교 도서관
  LatLng(37.5974538, 126.8917158); // 연세대학교 도서관

  static final CameraPosition initialPosition =
      CameraPosition(target: companyLatLng, zoom: 15);

  static final double okDistance = 150; // meter

  static final Circle withinDistanceCircle = Circle(
    circleId: CircleId('withinDistanceCircle'),
    center: companyLatLng,
    fillColor: Colors.blue.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.blue,
    // border
    strokeWidth: 1,
  );

  static final Circle notWithinDistanceCircle = Circle(
    circleId: CircleId('notWithinDistanceCircle'),
    center: companyLatLng,
    fillColor: Colors.red.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.red,
    // border
    strokeWidth: 1,
  );

  static final Circle checkDoneCircle = Circle(
    circleId: CircleId('checkDoneCircle'),
    center: companyLatLng,
    fillColor: Colors.green.withOpacity(0.5),
    radius: okDistance,
    strokeColor: Colors.green,
    // border
    strokeWidth: 1,
  );

  static final Marker marker = Marker(
    markerId: MarkerId('marker'),
    position: companyLatLng,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == '위치 권한이 허가되었습니다.') {
            return Center(
              child: StreamBuilder<Position>(
                  stream: Geolocator.getPositionStream(),
                  builder: (context, snapshot) {
                    bool isWithinRange = false;

                    if (snapshot.hasData) {
                      final start = snapshot.data!;
                      final end = companyLatLng;

                      final distance = Geolocator.distanceBetween(
                          start.latitude,
                          start.longitude,
                          end.latitude,
                          end.longitude);

                      if (distance < okDistance) {
                        isWithinRange = true;
                      }
                    }

                    return Column(
                      children: [
                        Expanded(
                            child: Stack(
                          children: [
                            _googleMap(
                              initialPosition: initialPosition,
                              circle: choolCheckDone
                                  ? checkDoneCircle
                                  : isWithinRange
                                      ? withinDistanceCircle
                                      : notWithinDistanceCircle,
                              marker: marker,
                              onMapCreated: onMapCreated,
                            ),
                            ChoolCheckButton(
                              isWithinRange: isWithinRange,
                              choolCheckDone: choolCheckDone,
                              withinOnPressed: withinOnPressed,
                              outRangeOnPressed: outRangeOnPressed,
                            )
                          ],
                        )),
                        _friendsList()
                      ],
                    );
                  }),
            );
          }
          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void withinOnPressed() async {
    final result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('출석하기'),
            content: Text('출석을 하시겠습니까?'),
            actions: [
              TextButton(
                  onPressed: () {
                    DateTime today = DateTime.now();
                    print('${today.year}/${today.month}/${today.day}');
                    Navigator.of(context).pop(false);
                  },
                  child: Text('취소')),
              TextButton(
                  onPressed: () async {
                    // 출석하기 버튼 누르면
                    await MapRepository.attendanceCheck();
                    Navigator.of(context).pop(true);
                  },
                  child: Text('출석하기')),
            ],
          );
        });
    if (result) {
      setState(() {
        choolCheckDone = true;
      });
    }
  }

  void outRangeOnPressed() async {
    // final result = await showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Text('출근하기'),
    //         content: Text('출근을 하시겠습니까?'),
    //         actions: [
    //           TextButton(
    //               onPressed: () {
    //                 Navigator.of(context).pop(false);
    //               },
    //               child: Text('취소')),
    //           TextButton(
    //               onPressed: () {
    //                 Navigator.of(context).pop(true);
    //               },
    //               child: Text('출근하기')),
    //         ],
    //       );
    //     });
    // if (result) {
    //   // setState(() {
    //   //   choolCheckDone = true;
    //   // });
    // }
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator
        .isLocationServiceEnabled(); // 앱과 무관하게 핸드폰의 gps 권한이 꺼져 있으면..

    choolCheckDone = await MapRepository.todayAttendCheck();

    if (!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요.';
    }

    // 밑은 true이다.

    LocationPermission checkedPermission =
        await Geolocator.checkPermission(); // 현재 앱이 갖고있는 위치 서비스에 대한 권한

    if (checkedPermission == LocationPermission.denied) {
      // 앱 처음 켜면 denied 상태이다.
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        // checkedPermission = await Geolocator.requestPermission();
        return '위치 권한을 허가해주세요.';
      }
    }
    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 세팅에서 허가해주세요.';
    }
    return '위치 권한이 허가되었습니다.';
  }

  SizedBox _friendsList() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [Icon(Icons.person_outline), Text('친구 $index')],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 4),
          ),
          IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.add_circle_rounded,
                color: Colors.lightGreenAccent,
              ))
        ],
      ),
    );
  }
}

class _googleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;
  final MapCreatedCallback onMapCreated;

  const _googleMap(
      {required this.initialPosition,
      required this.circle,
      required this.marker,
      required this.onMapCreated,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
        myLocationEnabled: true,
        circles: Set.from([circle]),
        markers: Set.from([marker]),
        onMapCreated: onMapCreated,
      ),
    );
  }
}

