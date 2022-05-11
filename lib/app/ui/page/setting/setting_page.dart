import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_attend_check/app/controller/auth_controller.dart';
import 'package:library_attend_check/app/ui/page/setting/edit_lib_page.dart';
import 'package:library_attend_check/app/ui/page/setting/edit_profile_page.dart';
import 'package:library_attend_check/root_page.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

bool isDarkMode = false;

class _SettingPageState extends State<SettingPage> {
  late Box _darkMode;
  bool isSwitched = false;
  bool _vib = false;

  @override
  void initState() {
    _darkMode = Hive.box('darkModeBox');
    isDarkMode = _darkMode.get('darkMode', defaultValue: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        sections: [
          _common(),
          // _alarm(),

          _aboutApp(),
        ],
      ),
    );
  }

  SettingsSection _common() {
    return SettingsSection(
      title: Text('Common'),
      tiles: <SettingsTile>[
        SettingsTile.navigation(
          leading: Icon(Icons.account_box_outlined),
          title: Text('My Profile'),
          // value: Text('English'),
          onPressed: (context) {
            Get.to(EditProfilePage());
          },
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        SettingsTile.navigation(
          leading: Icon(Icons.account_balance_outlined),
          title: Text('출석 도서관 변경'),
          onPressed: (context) {
            Get.to(EditLibPage());
          },
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        SettingsTile.switchTile(
          onToggle: (value) {
            setState(() {
              changeAppMode(value);
            });
          },
          initialValue: isDarkMode,
          leading: Icon(Icons.format_paint),
          title: Text('Dark Theme'),
        ),
        SettingsTile.navigation(
          leading: Icon(
            Icons.logout,
            color: Colors.red,
          ),
          title: Text(
            'Log Out',
            style: TextStyle(color: Colors.red),
          ),
          // value: Text('English'),
          onPressed: (context) async {
            await signOut();
          },
        ),
      ],
    );
  }

  SettingsSection _alarm() {
    return SettingsSection(
      title: Text('Alarm'),
      tiles: <SettingsTile>[
        SettingsTile.navigation(
          leading: Icon(Icons.list),
          title: Text(
            'Alarm List',
            style: TextStyle(),
          ),
          onPressed: (context) {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>@@@));
          },
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        // ElevatedButton(onPressed: (){}, child: Container()),
        SettingsTile.switchTile(
          onToggle: (value) {},
          initialValue: true,
          leading: Icon(Icons.add_alert_outlined),
          title: Text('Alarm On'),
        ),
      ],
    );
  }

  SettingsSection _aboutApp() {
    return SettingsSection(
      title: Text('About App'),
      tiles: <SettingsTile>[
        SettingsTile.navigation(
          leading: Icon(CupertinoIcons.rectangle_stack_person_crop),
          title: Text('About us'),
          onPressed: (context) {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>@@@));
          },
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        SettingsTile.navigation(
          leading: Icon(CupertinoIcons.wrench),
          title: Text('Help'),
          onPressed: (context) {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>@@@));
          },
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        SettingsTile.navigation(
          leading: Icon(Icons.account_balance_outlined),
          title: Text('License'),
          onPressed: (context) {
            Get.to(LicensePage());
          },
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  void changeAppMode(bool isDark) {
    setState(() {
      if (isDark == true) {
        isDarkMode = true;
        _darkMode.put('darkMode', true);
      } else {
        isDarkMode = false;
        _darkMode.put('darkMode', false);
      }
    });
    print;
  }

  Future<void> signOut() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    AuthController.to.signOut();
    Get.to(() => RootPage());
  }
}
