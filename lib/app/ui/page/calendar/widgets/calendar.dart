import 'dart:collection';
import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:library_attend_check/app/ui/page/calendar/page/event.dart';
import 'package:library_attend_check/app/ui/page/constant/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;

  const Calendar(
      {required this.selectedDay,
      required this.focusedDay,
      required this.onDaySelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Event>> eventSource = {
      DateTime.utc(2022, 5, 3): [
        Event(title: '5분 기도하기', check: false),
        Event(title: '교회 가서 인증샷 찍기', check: true),
        Event(title: 'QT하기', check: true),
        Event(title: '셀 모임하기', check: false),
      ],
      DateTime.utc(2022, 5, 5): [
        Event(title: '5분 기도하기', check: false),
        Event(title: '치킨 먹기', check: true),
        Event(title: 'QT하기', check: true),
        Event(title: '셀 모임하기', check: false),
      ],
      DateTime.utc(2022, 5, 8): [
        Event(title: '5분 기도하기', check: false),
        Event(title: '자기 셀카 올리기', check: true),
        Event(title: 'QT하기', check: false),
        Event(title: '셀 모임하기', check: false),
      ],
      DateTime.utc(2022, 5, 11): [
        Event(title: '5분 기도하기', check: false),
        Event(title: '가족과 저녁식사 하기', check: true),
        Event(title: 'QT하기', check: true)
      ],
      DateTime.utc(2022, 5, 13): [
        Event(title: '5분 기도하기', check: false),
        Event(title: '교회 가서 인증샷 찍기', check: true),
        Event(title: 'QT하기', check: false),
        Event(title: '셀 모임하기', check: false),
      ],
      DateTime.utc(2022, 5, 15): [
        Event(title: '5분 기도하기', check: false),
        Event(title: '치킨 먹기', check: false),
        Event(title: 'QT하기', check: true),
        Event(title: '셀 모임하기', check: false),
      ],
      DateTime.utc(2022, 5, 18): [
        Event(title: '5분 기도하기', check: false),
        Event(title: '자기 셀카 올리기', check: true),
        Event(title: 'QT하기', check: false),
        Event(title: '셀 모임하기', check: false),
      ],
      DateTime.utc(2022, 5, 20): [
        Event(title: '5분 기도하기', check: true),
        Event(title: '자기 셀카 올리기', check: true),
        Event(title: 'QT하기', check: true),
        Event(title: '셀 모임하기', check: true),
      ],
      DateTime.utc(2022, 5, 21): [
        Event(title: '5분 기도하기', check: false),
        Event(title: '가족과 저녁식사 하기', check: true),
        Event(title: 'QT하기', check: false)
      ]
    };

    final events = LinkedHashMap(
      equals: isSameDay,
    )..addAll(eventSource);

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
      calendarBuilders: CalendarBuilders(
          // singleMarkerBuilder: (context, date, _) {
          //   return Container(
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: date == selectedDay ? Colors.white : Colors.black), //Change color
          //     width: 30.0,
          //     height: 30.0,
          //     margin: const EdgeInsets.symmetric(horizontal: 1.5),
          //   );
          // },
          markerBuilder: (BuildContext context, date, events) {
            if (events.isEmpty) return SizedBox();
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      // height: 7,
                      width: 5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                    ),
                  );
                });
          },
          dowBuilder: (context, day) {

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
