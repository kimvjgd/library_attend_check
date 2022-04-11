import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/ui/page/main/calendar_page.dart';
import 'package:library_attend_check/app/ui/page/main/map_page.dart';
import 'package:library_attend_check/app/ui/page/setting/setting_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: ExtendedImage.asset(
                        'asset/img/alpaca.png',
                        fit: BoxFit.cover,
                        height: 70,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text('동동이',style: TextStyle(fontSize: 30),)
                  ],
                ),
                Text('dongdong222@naver.com'),
                SizedBox(height: 3,),
                Row(children: [Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(CupertinoIcons.rectangle_paperclip),
                ), Text('서울대학교 도서관')],),
                Row(children: [Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(Icons.local_fire_department_outlined),
                ), Text('연속 3일 출석')],),
              ],
            ),
          )),
          ListTile(
            title: Text('출석'),
            onTap: () {
              Get.to(MapPage());
            },
          ), // 아마 여기서 navigator가 아니라 pagecontroller로 화면을 바꿔줘야겠다
          ListTile(
            title: Text('기록'),
            onTap: () {
              Get.to(CalendarPage());
            },
          ), //
          ListTile(
            title: Text('설정'),
            onTap: () {
              Get.to(SettingPage());
            },
          ), // settingPage는 Get.to로 보내고.
        ],
      ),
    );
  }
}