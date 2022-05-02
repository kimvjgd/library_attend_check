import 'package:get/get.dart';
import 'package:library_attend_check/app/data/model/app_user.dart';
import 'package:library_attend_check/app/data/repository/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  Rx<AppUser> user =
      AppUser().obs;

  void signOut() {
    user(AppUser());
  }

  Future<AppUser?> loginUser(String uid) async {
    var userData = await UserRepository.loginUserByUid(uid);
    if (userData != null) {
      user(userData);
      // InitBinding.add
    }
    print('userData : ${userData}');
    return userData;
  }
}
