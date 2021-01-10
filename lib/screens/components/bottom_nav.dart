import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:saloon_plus_barber/screens/bookings_package/appointments_home.dart';
import 'package:saloon_plus_barber/screens/bookings_package/bookings_home.dart';
import 'package:saloon_plus_barber/screens/profile_package/barber_profile.dart';

class BottomNav extends StatefulWidget {
  final int currentIndex;
  BottomNav({this.currentIndex});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int botNavIndex = 1;
  List<Widget> _list;

  @override
  void initState() {
    botNavIndex = widget.currentIndex ?? 1;

    _list = [
      BookingsHome(),
      BarberProfile(),
      Container(
        color: Colors.red,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Scaffold(
          body: SafeArea(child: _list[botNavIndex]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: FontStyle.secondaryColor,
                  offset: Offset(0.0, -1.0),
                ),
              ],
            ),
            height: 58.0.h,
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: FontStyle.primaryColor,
              ),
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: "Bookings",
                    icon: Padding(
                        padding: EdgeInsets.only(bottom: 1.0.h),
                        child: Icon(Icons.calendar_today)),
                  ),
                  BottomNavigationBarItem(
                    label: "Profile",
                    icon: Padding(
                        padding: EdgeInsets.only(bottom: 1.0.h),
                        child: Icon(Icons.account_box)),
                  ),
                  BottomNavigationBarItem(
                    label: "Search",
                    icon: Padding(
                        padding: EdgeInsets.only(bottom: 1.0.h),
                        child: Icon(Icons.search)),
                  ),
                ],
                iconSize: 25.0.h,
                showUnselectedLabels: true,
                selectedIconTheme: IconThemeData(size: 30.0.h),
                unselectedIconTheme: IconThemeData(size: 25.0.h),
                selectedItemColor: FontStyle.secondaryColor,
                unselectedItemColor: FontStyle.secondaryColorWithOpacity,
                currentIndex: botNavIndex,
                selectedLabelStyle:
                    FontStyle.productsansBold(FontStyle.secondaryColor, 10.0),
                unselectedLabelStyle: FontStyle.productsansRegular(
                    FontStyle.secondaryColorWithOpacity, 9.0),
                onTap: (val) {
                  setState(() {
                    botNavIndex = val;
                  });
                },
              ),
            ),
          ),
        ));
  }
}
