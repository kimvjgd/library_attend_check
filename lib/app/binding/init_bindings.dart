import 'package:get/get.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/controller/drawer_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController(), permanent: true);
    Get.put(EndDrawerController(),permanent: true);
  }
}