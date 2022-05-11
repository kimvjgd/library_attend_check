import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_attend_check/app/data/model/firestore_keys.dart';

class TodoModel {
  String? title;
  bool? done;
  String? color;

  TodoModel({required this.title, required this.done,required this.color});

  factory TodoModel.fromJson(
      Map<String, dynamic> json, DocumentReference reference
      ){
    return TodoModel(
      title: json[KEY_TODO_TITLE] == null ? '' : json[KEY_TODO_TITLE] as String,
      done: json[KEY_TODO_DONE] == null ? false : json[KEY_TODO_DONE] as bool,
      color: json[KEY_TODO_COLOR] == null ? '0' : json[KEY_TODO_COLOR] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      KEY_TODO_TITLE: title,
      KEY_TODO_DONE: done,
      KEY_TODO_COLOR: color,
    };
  }
}