import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';
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
    if(widget.currentindex == null){
      setState(() {
        widget.currentindex=0;
      });
    }
    setState(() {
      _list=[
        Container(),
        Container(),
        SearchHome(),
        Container(),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
            child: _list[widget.currentindex]
        ),
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
                  title: Text("Home"),
                  icon: Padding(
                      padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                      child: Icon(FontAwesomeIcons.home)),
                ),
                BottomNavigationBarItem(
                  title: Text("Favourite"),
                  icon: Padding(
                      padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                      child: Icon(Icons.favorite_border)),
                ),
                BottomNavigationBarItem(
                  title: Text("Search"),
                  icon: Padding(
                      padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                      child: Icon(Icons.search)),
                ),
                BottomNavigationBarItem(
                  title: Text("Profile"),
                  icon: Padding(
                      padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                      child: Icon(Icons.person_outline)),
                ),
              ],
              iconSize: 26.h,
              showUnselectedLabels: true,
              selectedItemColor: Font_Style.secondaryColor,
              unselectedItemColor: Font_Style.secondaryColorWithOpacity,
              currentIndex:widget.currentindex,
              selectedLabelStyle: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 9.0),
              unselectedLabelStyle: Font_Style()
                  .montserrat_Regular(Font_Style.secondaryColorWithOpacity, 9.0),
              onTap: (val) {
                setState(() {
                  widget.currentindex = val;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectAppBar() {
    switch(widget.currentindex) {
      case 0 :
        return Text("");
    }
  }
}
