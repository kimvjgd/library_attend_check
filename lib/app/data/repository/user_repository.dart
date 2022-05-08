import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_attend_check/app/data/model/app_user.dart';
import 'package:library_attend_check/app/data/model/firestore_keys.dart';
import 'package:logger/logger.dart';

class UserRepository {
  static Future<AppUser?> loginUserByUid(String uid) async {
    var data = await FirebaseFirestore.instance
        .collection(COLLECTION_USERS)
        .where(KEY_USER_UID, isEqualTo: uid)
        .get();

    if (data.size == 0) {
      return null;
    } else {
      Logger().d(data.docs.first.data());
      return AppUser.fromJson(data.docs.first.data());
    }
  }

  static Future<bool> signup(AppUser user) async {
    try {
      await FirebaseFirestore.instance
          .collection(COLLECTION_USERS)
          .doc(user.uid)
          .set(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
