import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/data/provider/univ_list.dart';

class EditLibPage extends StatefulWidget {
  const EditLibPage({Key? key}) : super(key: key);

  @override
  State<EditLibPage> createState() => _EditLibPageState();
}

class _EditLibPageState extends State<EditLibPage> {

  TextEditingController _univController = TextEditingController();

  @override
  void dispose() {
    _univController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProfilePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40,),
          Text(AuthController.to.user.value.university!,style: TextStyle(fontSize: 20),),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child:           TypeAheadField<String>(
              suggestionsCallback: (String pattern) {
                return univList.where(
                        (item) => item.toLowerCase().contains(pattern.toLowerCase()));
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
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextButton(
              onPressed: () {
                ///TODO : update 추가기능 예정
                Get.back();
              },
              child: Text('확인'),
            ),
          ),
        ],
      ),
    );
  }
}
