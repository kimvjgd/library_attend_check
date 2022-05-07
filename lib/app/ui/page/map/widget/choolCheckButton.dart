import 'package:flutter/material.dart';

class ChoolCheckButton extends StatelessWidget {
  final bool isWithinRange;
  final VoidCallback withinOnPressed;
  final VoidCallback outRangeOnPressed;
  final bool choolCheckDone;

  const ChoolCheckButton(
      {required this.isWithinRange,
        required this.withinOnPressed,
        required this.outRangeOnPressed,
        required this.choolCheckDone,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.07,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: choolCheckDone
                ? ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.lightGreen),
              onPressed: outRangeOnPressed,
              //     () {
              //
              // },
              child: Text(
                '출석 완료',
                style:
                TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
            )
                : isWithinRange
                ? ElevatedButton(
              onPressed: withinOnPressed,
              //     () {
              //   showDialog(
              //       context: context,
              //       builder: (context) => Dialog(
              //             child: Column(
              //               mainAxisSize: MainAxisSize.min,
              //               children: [
              //                 ExtendedImage.asset(
              //                   'asset/img/fire.png',
              //                   fit: BoxFit.cover,
              //                 ),
              //                 Text('연속 3일 출석'),
              //               ],
              //             ),
              //           ));
              // },
              child: Text(
                '출 석 하 기',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w300),
              ),
            )
                : ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey),
              onPressed: outRangeOnPressed,
              //     () {
              //
              // },
              child: Text(
                '도서관 근처로..',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ));
  }
}
