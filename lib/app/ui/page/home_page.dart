import 'package:flutter/material.dart';
import 'package:library_attend_check/app/ui/page/map/map_page.dart';
import 'package:library_attend_check/app/ui/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        endDrawer: MainDrawer(),
      body: MapPage(),
    );
  }
}
