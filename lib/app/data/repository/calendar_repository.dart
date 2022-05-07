// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:library_attend_check/app/data/model/app_user.dart';
// import 'package:library_attend_check/app/data/model/firestore_keys.dart';
//
// class UserRepository {
//   static Future<AppUser?> loginUserByUid(String uid) async {
//     var data = await FirebaseFirestore.instance
//         .collection('users')
//         .where('uid', isEqualTo: uid)
//         .get();
//
//     if (data.size == 0) {
//       return null;
//     } else {
//       return AppUser.fromJson(data.docs.first.data());
//     }
//   }
//
//   static Future<bool> signup(AppUser user) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection(COLLECTION_USERS)
//           .add(user.toMap());
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/data/model/firestore_keys.dart';
import 'package:library_attend_check/app/utils/date_utils.dart';
import 'package:logger/logger.dart';

class CalendarRepository {
  // static Future<List<DateTime>> getAllAttendDate() async {
  static Future<List<DateTime>> getAllAttendDate() async {

    var data = await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .where(KEY_USER_EMAIL, isEqualTo: AuthController.to.user.value.email)
        .get();
    List<dynamic> dataStringData =
        data.docs[0].data()[KEY_USER_ATTENDANCE_LIST];
    List<DateTime> dateDateTimeData = [];
    for (String datum in dataStringData) {
      dateDateTimeData.add(DateUtils.stringToDateTime(datum));
    }
    return dateDateTimeData;
  }
}
