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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: 30,
                height: 30,
                color: Colors.red,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
            ],
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
