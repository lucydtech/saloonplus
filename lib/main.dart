import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:saloonplus/screens/login_signup/loginandsignup.dart';
import 'package:saloonplus/welcome.dart';
import 'ThemeData/fontstyle.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saloon+',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Font_Style.primaryColor,
          cursorColor: Font_Style.primaryColor),
      routes: {
        '/': (context) => Welcome(),
        '/login_signup': (context) => LoginSignUp(),
      },
      initialRoute: '/',
    );
  }
}