import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:saloon_plus_barber/screens/bookings_package/today_package/today_service_details.dart';
import 'package:saloon_plus_barber/screens/components/bottom_nav.dart';
import 'package:saloon_plus_barber/screens/login_signup/loginandsignup.dart';
import 'package:saloon_plus_barber/screens/profile_package/info_screens/edit_info.dart';
import 'package:saloon_plus_barber/screens/welcome_package/welcome.dart';

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
          scaffoldBackgroundColor: FontStyle.primaryColor,
          primaryColor: FontStyle.primaryColor,
          cursorColor: FontStyle.secondaryColor),
      routes: {
        '/': (context) => Welcome(),
        'login_signUp': (context) => LoginSignUp(),
        'bottom_nav': (context) => BottomNav(),
        'edit_info': (context) => EditInfo(),
        'today_service_details': (context) => TodayServiceDetails(),
      },
      initialRoute: '/',
    );
  }
}
