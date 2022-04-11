import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/data/provider/univ_list.dart';
import 'package:library_attend_check/app/ui/page/main/map_page.dart';

class SignupInfoPage extends StatefulWidget {
  const SignupInfoPage({Key? key}) : super(key: key);

  @override
  State<SignupInfoPage> createState() => _SignupInfoPageState();
}

class _SignupInfoPageState extends State<SignupInfoPage> {
  TextEditingController _univController = TextEditingController();

  List<String> week = ['월','화','수','목','금','토','일'];

  @override
  void dispose() {
    _univController.dispose();
    super.dispose();
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('이름'),
              TextField(
                decoration: InputDecoration(
                    hintText: "이름을 적어주세요."),
              ),
              SizedBox(
                height: 50,
              ),
              Text('출석할 도서관'),
              TypeAheadField<String>(
                suggestionsCallback: (String pattern) {
                  return univList.where((item) =>
                      item.toLowerCase().contains(pattern.toLowerCase()));
                },
                itemBuilder: (BuildContext context, itemData) {
                  return ListTile(
                    title: Text(itemData),
                  );
                },
                onSuggestionSelected: (String suggestion) {
                  setState(() {
                    this._univController.text = suggestion;
                  });
                },
                textFieldConfiguration:
                    TextFieldConfiguration(controller: this._univController),
              ),
              SizedBox(
                height: 50,
              ),
              Text('출석할 요일'),
              SizedBox(
                height: 10,
              ),
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
              Text(''),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.lightGreen)),
                        onPressed: () {
                          Get.to(MapPage());
                        },
                        child: Text(
                          '시작하기',
                          style: TextStyle(fontSize: 30),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
