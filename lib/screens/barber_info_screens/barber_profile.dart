import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';
import 'package:saloonplus/screens/barber_info_screens/info.dart';
import 'package:saloonplus/screens/barber_info_screens/reviews.dart';
import 'package:saloonplus/screens/barber_info_screens/services.dart';

class BarberProfile extends StatefulWidget {
  @override
  _BarberProfileState createState() => _BarberProfileState();
}

class _BarberProfileState extends State<BarberProfile>
    with SingleTickerProviderStateMixin {
  TabController _barberProfileTabController;

  var _height, _width;

  @override
  void initState() {
    setState(() {
      _barberProfileTabController = TabController(length: 3, vsync: this);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white.withOpacity(0.8),
                height: _height / 4.0.h,
                padding:
                    EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.0.w),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: _height / 5.5, //140.0.w
                        height: _height / 5.5, //140.0.h
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/barber_shop.png")))),
                    SizedBox(
                      width: 18.0.w,
                    ),
                    Expanded(
                      child: Text(
                        "Barber Shop Name",
                        style: Font_Style()
                            .montserrat_Bold(Font_Style.middleColor, 22),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Container(
                height: 50.0.h,
                padding: EdgeInsets.only(top: 5.0.h),
                child: Center(
                  child: TabBar(
                    indicatorColor: Font_Style.secondaryColor,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 18.0.w),
                    controller: _barberProfileTabController,
                    onTap: (int x) {
                      _barberProfileTabController.index = x;
                    },
                    labelPadding:
                        EdgeInsets.only(bottom: 10.5.h, left: 0, right: 0),
                    unselectedLabelColor:
                        Font_Style.secondaryColor.withOpacity(0.7),
                    labelColor: Font_Style.secondaryColor,
                    labelStyle: Font_Style()
                        .montserrat_Bold(Font_Style.secondaryColor, 22),
                    unselectedLabelStyle: Font_Style()
                        .montserrat_SemiBold(Font_Style.secondaryColor, 22),
                    tabs: <Widget>[
                      Text(
                        "INFO",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        overflow: TextOverflow.visible,
                      ),
                      Text(
                        "SERVICES",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        overflow: TextOverflow.visible,
                      ),
                      Text(
                        "REVIEWS",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.0.h, horizontal: 8.0.w),
                  child: TabBarView(
                    controller: _barberProfileTabController,
                    children: <Widget>[
                      barberInfoTab(context),
                      barberServicesTab(context),
                      barberReviewsTav(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
