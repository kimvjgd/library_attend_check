import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLibPage extends StatelessWidget {
  const EditLibPage({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(decoration: InputDecoration(hintText: "도서관 이름"),),
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
