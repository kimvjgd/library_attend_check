import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/ui/page/main/map_page.dart';

class SignupInfoPage extends StatelessWidget {
  const SignupInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Info Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Get.to(MapPage());
          },
          child: Column(
            children: [
              Text('이름'),
              TextField(
                decoration: InputDecoration(hintText: "이름을 적어주세요."),
              ),
              SizedBox(
                height: 50,
              ),
              Text('출석할 도서관'),
              TextField(
                decoration: InputDecoration(hintText: "출석할 도서관을 선택해주세요."),
              ),
              SizedBox(
                height: 50,
              ),
              Text('출석할 요일'),
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
              Text(''),
              Spacer(),
              Text(
                '다음',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
