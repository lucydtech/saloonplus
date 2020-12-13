import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:saloon_plus_barber/screens/profile_package/reviews.dart';
import 'package:saloon_plus_barber/screens/profile_package/services.dart';
import 'package:saloon_plus_barber/screens/profile_package/info_screens/info.dart';

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
              Container(
                color: Colors.white.withOpacity(0.8),
                height: _height / 4.0.h,
                padding:
                EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.0.w),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 8.0.w,),
                    Container(
                        width: _height / 6.0, //140.0.w
                        height: _height / 6.0, //140.0.h
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
                        style: Font_Style
                            .productsans_Bold(Font_Style.middleColor, 22),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50.0.h,
                padding: EdgeInsets.only(top: 5.0.h),
                child: Center(
                  child: TabBar(
                    indicatorColor: Font_Style.secondaryColor,
                    //indicatorPadding: EdgeInsets.symmetric(horizontal: 18.0.w),
                    indicatorWeight: 0.5,
                    controller: _barberProfileTabController,
                    onTap: (int x) {
                      _barberProfileTabController.index = x;
                    },
                    labelPadding:
                        EdgeInsets.only(bottom: 7.0.h,),
                    unselectedLabelColor:
                        Font_Style.secondaryColor.withOpacity(0.7),
                    labelColor: Font_Style.secondaryColor,
                    labelStyle: Font_Style
                        .productsans_Bold(Font_Style.secondaryColor, 16),
                    unselectedLabelStyle: Font_Style
                        .productsans_SemiBold(Font_Style.secondaryColor, 16),
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
