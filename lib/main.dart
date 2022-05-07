import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:library_attend_check/app/binding/init_bindings.dart';
import 'package:library_attend_check/app/ui/page/home_page.dart';
import 'package:library_attend_check/app/ui/page/intro/login_page.dart';
import 'package:library_attend_check/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Hive.initFlutter();
  await Hive.openBox('darkModeBox');
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
    return ValueListenableBuilder(
      builder: (context, Box box, widget){
        final darkMode = box.get('darkMode', defaultValue: true);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
          ),
            darkTheme: darkMode
                ? ThemeData(
              brightness: Brightness.dark,
              /* dark theme setting */
            )
                : ThemeData(
              brightness: Brightness.light,
              /* dark theme setting */
            ),
          initialBinding: InitBinding(),
          home: RootPage(),
          // initialRoute: "/",
          // getPages: [
          //   GetPage(name: "/", page: ()=>RootPage(),)
          // ],
        );
      }, valueListenable: Hive.box('darkModeBox').listenable(),
    );
  }
}
