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

  double _height, _width;

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
              Stack(
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
                                    image: AssetImage("assets/images/barber_shop.png")
                                )
                            )
                        ),
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
                  Positioned(
                      left: 7.0.w,
                      top: 7.0.h,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                          child: Icon(Icons.arrow_back, size: 26.0, color: Font_Style.primaryColor,)))
                ],
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
                        EdgeInsets.only(bottom: 7.0.h,),
                    unselectedLabelColor:
                        Font_Style.secondaryColor.withOpacity(0.7),
                    labelColor: Font_Style.secondaryColor,
                    labelStyle: Font_Style()
                        .montserrat_Bold(Font_Style.secondaryColor, 18),
                    unselectedLabelStyle: Font_Style()
                        .montserrat_SemiBold(Font_Style.secondaryColor, 18),
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
                  padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w, bottom: 5.0.h),
                  child: TabBarView(
                    controller: _barberProfileTabController,
                    children: <Widget>[
                      BarberInfoTab(),
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
