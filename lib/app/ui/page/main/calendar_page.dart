import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/ui/page/setting/setting_page.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Page'),
      ),
      body: Center(
        child: TextButton(onPressed: () {
          Get.to(SettingPage());
        },
          child: Text('다음'),

        ),
      ),
    );
  }
}
