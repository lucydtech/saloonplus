import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:saloonplus/screens/barber_info_screens/barber_profile.dart';
import 'package:saloonplus/screens/components/bottom_nav.dart';
import 'package:saloonplus/screens/login_signup/loginandsignup.dart';
import 'package:saloonplus/screens/service_payment_screens/add_card.dart';
import 'package:saloonplus/screens/service_payment_screens/select_service.dart';
import 'package:saloonplus/screens/service_payment_screens/summary.dart';
import 'package:saloonplus/welcome.dart';
import 'ThemeData/fontstyle.dart';

void main() async{
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
          scaffoldBackgroundColor: Font_Style.primaryColor,
          primaryColor: Font_Style.primaryColor,
          cursorColor: Font_Style.secondaryColor),
      routes: {
        '/': (context) => Welcome(),
        '/login_signup': (context) => LoginSignUp(),
        '/bottom_nav': (context) => BottomNav(),
        '/barber_profile': (context) => BarberProfile(),
        '/select_service': (context) => SelectService(),
        '/summary': (context) => Summary(),
        '/add_card': (context) => AddCard(),
      },
      initialRoute: '/',
    );
  }
}