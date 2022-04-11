import 'package:flutter/material.dart';
import 'package:library_attend_check/app/ui/page/constant/colors.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatelessWidget {

  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  const Calendar({
    required this.selectedDay,
    required this.focusedDay,
    required this.onDaySelected,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.grey[200],
    );

    final defaultTextStyle =
        TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w700);

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(1900),
      lastDay: DateTime(2100),
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
