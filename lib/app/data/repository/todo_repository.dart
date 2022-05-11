import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/data/model/firestore_keys.dart';
import 'package:logger/logger.dart';

class TodoRepository {
  // static Future<List<dynamic>> getTodo(String year, String month, String day) async {
  //   String selectedDate = '${year}.${month.padLeft(2,'0')}.${day.padLeft(2,'0')}';
  //   var data = await FirebaseFirestore.instance.collection(COLLECTION_USERS)
  //       .doc(AuthController.to.user.value.uid).collection(COLLECTION_TODOS).doc(selectedDate).get();
  //   if (data.data()==null) return [];
  //   return data.data()![KEY_TODO_LIST];
  // }
  static Future<List<dynamic>> getTodo(DateTime selectedDate) async {
    String date =
        '${selectedDate.year.toString()}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.day.toString().padLeft(2, '0')}';
    var data = await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc(AuthController.to.user.value.uid)
        .collection(COLLECTION_TODOS)
        .doc(date)
        .get();
    if (data.data() == null) return [];
    return data.data()![KEY_TODO_LIST];
  }

  static Future<void> addTodo(DateTime selectedDate, String title) async {
    String date =
        '${selectedDate.year.toString()}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.day.toString().padLeft(2, '0')}';
    var temp_data = await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc(AuthController.to.user.value.uid)
        .collection(COLLECTION_TODOS)
        .doc(date);
    print(temp_data);
    var prev_data = await temp_data.get();

    if (prev_data.data() != null) {
      List<dynamic> tempList = await prev_data.get(KEY_TODO_LIST) ?? [];
      tempList.add({KEY_TODO_TITLE: title, KEY_TODO_DONE: false});
      await temp_data.update({KEY_TODO_LIST: tempList});
    } else {
      Map<String, dynamic> tempMap = {
        KEY_TODO_TITLE: title,
        KEY_TODO_DONE: false
      };
      List<dynamic> tempList = [tempMap];
      await temp_data.set({KEY_TODO_LIST: tempList});
    }
  }
}
