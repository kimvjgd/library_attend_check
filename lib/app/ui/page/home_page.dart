import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/controller/drawer_controller.dart';
import 'package:library_attend_check/app/ui/page/calendar/page/calendar_page.dart';
import 'package:library_attend_check/app/ui/page/map/map_page.dart';
import 'package:library_attend_check/app/ui/page/setting/setting_page.dart';
import 'package:library_attend_check/app/ui/widgets/main_drawer.dart';
import 'package:library_attend_check/app/ui/widgets/message_popup.dart';

class HomePage extends GetView<EndDrawerController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopAction,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        endDrawer: MainDrawer(),
        body: Obx(
          () => IndexedStack(
            index: controller.pageIndex.value,
            children: [
              MapPage(),
              CalendarPage(),
              SettingPage(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> willPopAction() async {
    showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: '알림!',
          message: '정말 종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: Get.back,
        ));
    return true;
  }

}
