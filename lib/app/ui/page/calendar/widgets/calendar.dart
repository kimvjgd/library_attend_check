import 'dart:collection';
import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:library_attend_check/app/ui/page/calendar/page/event.dart';
import 'package:library_attend_check/app/ui/page/constant/colors.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  final List<DateTime> attendDateList;

  const Calendar(
      {required this.selectedDay,
      required this.focusedDay,
      required this.onDaySelected,
        required this.attendDateList,
      Key? key})
      : super(key: key);



  @override
  Widget build(BuildContext context) {


    Map<DateTime, List<Event>> tempEventSource = {};

    attendDateList.forEach((element) {
      tempEventSource.addAll({element:[Event(check: true)]});
    });


    final events = LinkedHashMap(
      equals: isSameDay,
    )..addAll(tempEventSource);

    List<Event> getEventsForDay(DateTime day) {
      return events[day] ?? [];
    }

    final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.grey[300],
    );

    final defaultTextStyle =
        TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w700);

    return TableCalendar(
      calendarBuilders:
          CalendarBuilders(markerBuilder: (BuildContext context, date, events) {
        if (events.isEmpty) return SizedBox();
        return Container(
          // margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(bottom: 5.8),
          child: Opacity(
            opacity: 0.6,
            child: Container(
              // height: 7,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.green[300],
              ),
            ),
          ),
        );
      }, dowBuilder: (context, day) {
        switch (day.weekday) {
          case 6:
            return Center(
              child: Text(
                '토',
                style: TextStyle(color: Colors.blue),
              ),
            );
          case 7:
            return Center(
              child: Text(
                '일',
                style: TextStyle(color: Colors.red),
              ),
            );
        }
      }),
      eventLoader: (day) {
        // return eventList;
        return getEventsForDay(day);
      },
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(1980),
      lastDay: DateTime(2080),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          // 오늘 날짜
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,

          // markerDecoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('asset/img/fire.png'), opacity: 0.3)),
          selectedDecoration: defaultBoxDeco.copyWith(
              color: Colors.white,
              border: Border.all(width: 1, color: PRIMARY_COLOR)),
          outsideDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          canMarkersOverflow: false,
          selectedTextStyle: defaultTextStyle.copyWith(color: PRIMARY_COLOR)),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        // 실행하고 있는 모든 날짜에 대해서 실행한다. 그래서 true이면 표시
        if (selectedDay == null) {
          return false;
        }
        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}
