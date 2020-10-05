import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';
import 'package:saloonplus/screens/booking_screens/booking_home.dart';
import 'package:saloonplus/screens/home_screens/home.dart';
import 'package:saloonplus/screens/search_sreens/search_home.dart';

class BottomNav extends StatefulWidget {
  var currentindex;

  BottomNav({this.currentindex});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> _list;

  @override
  void initState() {
    if (widget.currentindex == null) {
      setState(() {
        widget.currentindex = 1;
      });
    }
    _list = [
      SearchHome(),
      Home(),
      BookingHome(),
    ];
    super.initState();
  }

  GlobalKey _curvedBottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Scaffold(
          body: SafeArea(child: _list[widget.currentindex]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Font_Style.secondaryColor,
                  offset: Offset(0.0, -1.0),
                ),
              ],
            ),
            height: 65.0.h,
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Font_Style.primaryColor,
              ),
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    title: Center(child: Text("Search")),
                    icon: Padding(
                        padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                        child: Icon(Icons.search)),
                  ),
                  BottomNavigationBarItem(
                    title: Center(child: Text("Home")),
                    icon: Padding(
                        padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                        child: Icon(FontAwesomeIcons.home)),
                  ),
                  BottomNavigationBarItem(
                    title: Center(child: Text("Bookings")),
                    icon: Padding(
                        padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                        child: Icon(Icons.collections_bookmark)),
                  ),
                ],
                iconSize: 25.0.h,
                showUnselectedLabels: true,
                selectedIconTheme: IconThemeData(size: 30.0.h),
                unselectedIconTheme: IconThemeData(size: 25.0.h),
                selectedItemColor: Font_Style.secondaryColor,
                unselectedItemColor: Font_Style.secondaryColorWithOpacity,
                currentIndex: widget.currentindex,
                selectedLabelStyle: Font_Style()
                    .montserrat_Bold(Font_Style.secondaryColor, 10.0),
                unselectedLabelStyle: Font_Style().montserrat_Regular(
                    Font_Style.secondaryColorWithOpacity, 9.0),
                onTap: (val) {
                  setState(() {
                    widget.currentindex = val;
                  });
                },
              ),
            ),
          ),
        ));
  }
}

/*
CurvedNavigationBar(
            height: 55.0.h,
            index: 1,
            key: _curvedBottomNavigationKey,
            animationDuration: Duration(milliseconds: 700),
            animationCurve: Curves.easeOutCubic,
            color: Font_Style.primaryColor,
            backgroundColor: Font_Style.secondaryColor,
            buttonBackgroundColor: Font_Style.primaryColor,
            items: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                  child: Icon(Icons.collections_bookmark, color: Font_Style.secondaryColor,)),
              Padding(
                  padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                  child: Icon(FontAwesomeIcons.home, color: Font_Style.secondaryColor)),
              Padding(
                  padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                  child: Icon(Icons.search, color: Font_Style.secondaryColor)),
            ],
            onTap: (index) {
              setState(() {
                widget.currentindex = index;
              });
            },
          )),
 */
