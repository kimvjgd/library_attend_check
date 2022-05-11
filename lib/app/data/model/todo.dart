import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_attend_check/app/data/model/firestore_keys.dart';

class TodoModel {
  String? title;
  bool? done;

  TodoModel({required this.title, required this.done});

  factory TodoModel.fromJson(
      Map<String, dynamic> json, DocumentReference reference
      ){
    return TodoModel(
      title: json[KEY_TODO_TITLE] == null ? '' : json[KEY_TODO_TITLE] as String,
      done: json[KEY_TODO_DONE] == null ? false : json[KEY_TODO_DONE] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      KEY_TODO_TITLE: title,
      KEY_TODO_DONE: done,
    };
  }
}