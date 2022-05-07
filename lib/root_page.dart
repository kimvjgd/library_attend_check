import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/data/model/app_user.dart';
import 'package:library_attend_check/app/ui/page/home_page.dart';
import 'package:library_attend_check/app/ui/page/intro/login_page.dart';
import 'package:library_attend_check/app/ui/page/intro/signup_info_page.dart';
import 'package:library_attend_check/app/ui/page/map/page/map_page.dart';

class RootPage extends GetView<AuthController> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> user) {
        if (user.hasData) {
          return FutureBuilder<AppUser?>(
              future: controller.loginUser(user.data!.uid),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return HomePage();
                } else {
                  return Obx(() => controller.user.value.uid == null
                      ? SignupInfoPage(uid: user.data!.uid)
                      : const HomePage());
                }
              });
        } else {
          return LoginPage();
        }
      },
    );
  }
}
