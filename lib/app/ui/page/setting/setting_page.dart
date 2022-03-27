import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/ui/page/setting/edit_attend_day.dart';
import 'package:library_attend_check/app/ui/page/setting/edit_lib_page.dart';
import 'package:library_attend_check/app/ui/page/setting/edit_profile_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () {
              Get.to(EditProfilePage());
            },
              child: Text('프로필 변경'),

            ),
            TextButton(onPressed: () {
              Get.to(EditAttendDay());
            },
              child: Text('출석 요일 변경'),

            ),
            TextButton(onPressed: () {
              Get.to(EditLibPage());
            },
              child: Text('출석 도서관 변경'),

            )
          ],
        ),
      ),
    );
  }
}
