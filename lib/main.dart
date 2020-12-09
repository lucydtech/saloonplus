import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saloon_plus_barber/screens/login_signup/loginandsignup.dart';
import 'package:saloon_plus_barber/screens/welcome_package/welcome.dart';
import 'ThemeData/fontstyle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saloon Barber',
      theme: ThemeData(
          scaffoldBackgroundColor: Font_Style.primaryColor,
          primaryColor: Font_Style.primaryColor,
          cursorColor: Font_Style.secondaryColor),
      routes: {
        '/': (context) => Welcome(),
        'login_signUp': (context) => LoginSignUp(),
      },
      initialRoute: '/',
    );
  }
}