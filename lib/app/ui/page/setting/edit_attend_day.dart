import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAttendDay extends StatelessWidget {
  const EditAttendDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> week = ['월','화','수','목','금','토','일'];

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                7,
                    (index) => Row(
                  children: [
                    Container(
                      child: Center(child: Text(week[index],textAlign: TextAlign.center,)),
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: 35,
                      height: 35,
                      color: Colors.lightGreenAccent,
                    ),
                    SizedBox(width: 12,)
                  ],
                )).toList(),
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
