import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/ui/page/main/component/calendar.dart';
import 'package:library_attend_check/app/ui/page/main/component/main_drawer.dart';
import 'package:library_attend_check/app/ui/page/main/component/schedule_card.dart';
import 'package:library_attend_check/app/ui/page/main/component/today_banner.dart';
import 'package:library_attend_check/app/ui/page/setting/setting_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime selectedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기록'),
      ),
      endDrawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Calendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: onDaySelected,
            ),
            SizedBox(
              height: 8.0,
            ),
            TodayBanner(selectedDay: selectedDay, scheduleCount: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
              child: TodoCard(todoCheck: false, content: '프로그래밍 공부하기', color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}
