import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:saloon_plus_barber/screens/components/bottom_nav.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 200), () {
      //Navigator.pushNamed(context, "login_signUp");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BottomNav(
                  currentIndex: 1,
                )),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 390, height: 812, allowFontScaling: true);
    return Scaffold(
      backgroundColor: FontStyle.primaryColor,
      body: SafeArea(
        child: Center(
          child: Container(
              padding: EdgeInsets.only(
                  left: 10.0.w, right: 10.0.w, top: 10.0.h, bottom: 10.0.h),
              child: Text(
                "Saloon+ Barber",
                style: FontStyle.productsansBold(FontStyle.secondaryColor, 22),
              )),
        ),
      ),
    );
  }
}
