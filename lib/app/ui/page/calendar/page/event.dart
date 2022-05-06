import 'package:flutter/cupertino.dart';

class Event {
  final String title;
  final bool check;
  Event({required this.title, required this.check});

  String toString() => title;
}