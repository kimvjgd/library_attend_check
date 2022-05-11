import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/data/model/firestore_keys.dart';
import 'package:library_attend_check/app/data/repository/calendar_repository.dart';
import 'package:library_attend_check/app/data/repository/todo_repository.dart';
import 'package:library_attend_check/app/ui/page/calendar/widgets/calendar.dart';
import 'package:library_attend_check/app/ui/page/calendar/widgets/todo_bottom_sheet.dart';
import 'package:library_attend_check/app/ui/widgets/main_drawer.dart';
import 'package:library_attend_check/app/ui/page/calendar/widgets/schedule_card.dart';
import 'package:library_attend_check/app/ui/page/calendar/widgets/today_banner.dart';
import 'package:library_attend_check/app/ui/page/setting/setting_page.dart';
import 'package:library_attend_check/app/ui/widgets/message_popup.dart';
import 'package:logger/logger.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<dynamic> todoList = [];
  DateTime selectedDay =
  DateTime(DateTime
      .now()
      .year, DateTime
      .now()
      .month, DateTime
      .now()
      .day);
  DateTime focusedDay = DateTime.now();
  List<DateTime> attendDateList = [];

  @override
  void initState() {
    initTodoList();
    super.initState();
  }

  Future<void> initTodoList() async {
    todoList = await TodoRepository.getTodo(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder<List<DateTime>>(
                future: CalendarRepository.getAllAttendDate(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  // Logger().d(snapshot.data!);
                  return Calendar(
                    selectedDay: selectedDay,
                    focusedDay: focusedDay,
                    onDaySelected: onDaySelected,
                    attendDateList: snapshot.data!,
                  );
                }),
            SizedBox(
              height: 8.0,
            ),
            TodayBanner(
                selectedDay: selectedDay, scheduleCount: todoList.length),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              MessagePopup(
                                title: "타이틀",
                                message: '메세지',
                                okCallback: () {

                                },
                                cancelCallback: () {
                                  Get.back();
                                },
                              ));
                    },
                    child: TodoCard(
                        todoCheck: true,
                        content: todoList[index][KEY_TODO_TITLE],
                        color: Colors.red),
                  );
                },
                itemCount: todoList.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          todoList =
              await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) {
                    return TodoBottomSheet(selectedDate: selectedDay,);
                  });
          setState(() {

          });
        },

        child: Icon(Icons.add),
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    todoList = await TodoRepository.getTodo(selectedDay);
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
    });
  }
}
