import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_attend_check/app/ui/page/setting/setting_page.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.list),
        )],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.red,)),
            TextButton(onPressed: (){
              Get.to(SettingPage());
            }, child: Text('다음'))
          ],
        ),
      ),
    );
  }
}
