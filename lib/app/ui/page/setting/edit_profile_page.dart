import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProfilePage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(decoration: InputDecoration(hintText: "이름"),),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('확인'),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
