import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:library_attend_check/app/binding/init_bindings.dart';
import 'package:library_attend_check/app/ui/page/home_page.dart';
import 'package:library_attend_check/app/ui/page/intro/login_page.dart';
import 'package:library_attend_check/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitBinding(),
      home: HomePage(),
      // initialRoute: "/",
      // getPages: [
      //   GetPage(name: "/", page: ()=>RootPage(),)
      // ],
    );
  }
}
