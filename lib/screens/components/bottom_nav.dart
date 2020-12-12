import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:saloon_plus_barber/screens/profile_package/barber_profile.dart';

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
      Container(color: Colors.red,),
      BarberProfile(),
      Container(color: Colors.green,),
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
            height: 58.0.h,
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Font_Style.primaryColor,
              ),
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    title: Center(child: Text("Search")),
                    icon: Padding(
                        padding: EdgeInsets.only(bottom: 1.0.h),
                        child: Icon(Icons.search)),
                  ),
                  BottomNavigationBarItem(
                    title: Center(child: Text("  Profile")),
                    icon: Padding(
                        padding: EdgeInsets.only(bottom: 1.0.h),
                        child: Icon(Icons.account_box)),
                  ),
                  BottomNavigationBarItem(
                    title: Center(child: Text("Bookings")),
                    icon: Padding(
                        padding: EdgeInsets.only(bottom: 1.0.h),
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
                selectedLabelStyle: Font_Style
                    .productsans_Bold(Font_Style.secondaryColor, 10.0),
                unselectedLabelStyle: Font_Style.productsans_Regular(
                    Font_Style.secondaryColorWithOpacity, 9.0),
                onTap: (val) {
                  setState(() {
                    widget.currentindex = val;
                  });
                },
              ),
            ),
          ),
        )
    );
  }
}