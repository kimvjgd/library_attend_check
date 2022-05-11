import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/data/model/app_user.dart';
import 'package:library_attend_check/app/data/model/firestore_keys.dart';
import 'package:library_attend_check/app/data/repository/user_repository.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppUser?>(
        future: UserRepository.getUserInfo(AuthController.to.user.value.uid!),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('EditProfilePage'),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                ClipOval(
                  child: ExtendedImage.network(
                    FirebaseAuth.instance.currentUser!.photoURL!,
                    height: 200,
                    width: 200,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'nickname\n\n - ${AuthController.to.user.value.nickname}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'email\n\n - ${AuthController.to.user.value.email}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'university\n\n - ${AuthController.to.user.value.university}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('확인'),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
