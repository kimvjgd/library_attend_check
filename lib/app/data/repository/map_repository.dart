import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/data/model/firestore_keys.dart';
import 'package:logger/logger.dart';

class MapRepository {
  static Future<void> attendanceCheck() async {
    DateTime today = DateTime.now();
    var data = await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .where(KEY_USER_EMAIL, isEqualTo: AuthController.to.user.value.email)
        .get();
    List<dynamic> dataStringData =
        data.docs[0].data()[KEY_USER_ATTENDANCE_LIST];
    Set<dynamic> semiResult = dataStringData.toSet();

    semiResult.add('${today.year}/${today.month}/${today.day}');
    // semiResult.add('adsadas');
    dataStringData = semiResult.toList();
    // Logger().d(dataStringData);
    Logger().d(AuthController.to.user.value.uid);

    await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .doc(AuthController.to.user.value.uid)
        .update({KEY_USER_ATTENDANCE_LIST: dataStringData});
  }
}
