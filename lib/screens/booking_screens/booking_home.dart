import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';

class BookingHome extends StatefulWidget {
  @override
  _BookingHomeState createState() => _BookingHomeState();
}

//sent, approved, rejected, cancelled, delivered

class _BookingHomeState extends State<BookingHome> with SingleTickerProviderStateMixin{

  TabController _bookingTabController;

  var _height, _width;

  @override
  void initState() {
    setState(() {
      _bookingTabController = TabController(length: 2, vsync: this);
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Font_Style.primaryColor,
          child: Column(
            children: <Widget>[
              Container(
                height: 55.0.h,
                padding: EdgeInsets.only(top: 5.0.h),
                child: Center(
                  child: TabBar(
                    indicatorColor: Font_Style.secondaryColor,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 18.0.w),
                    controller: _bookingTabController,
                    onTap: (int x) {
                      _bookingTabController.index = x;
                    },
                    labelPadding: EdgeInsets.only(bottom: 7.0.h,),
                    unselectedLabelColor: Font_Style.secondaryColor.withOpacity(0.7),
                    labelColor: Font_Style.secondaryColor,
                    labelStyle: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 18),
                    unselectedLabelStyle: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 18),
                    tabs: <Widget>[
                      Text("UPCOMING", textAlign: TextAlign.center, textDirection: TextDirection.ltr, overflow: TextOverflow.visible,),
                      Text("PAST", textAlign: TextAlign.center, textDirection: TextDirection.ltr, overflow: TextOverflow.visible,),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w,),
                  child: TabBarView(
                    controller: _bookingTabController,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Container(
                            height: 3.0.h,
                            color: Font_Style.dividerColor,
                          ),
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            return _upcoming();
                          },
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Container(
                            height: 2.0.h,
                            color: Font_Style.dividerColor,
                          ),
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            return _upcoming();
                          },
                        ),
                      ),
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

  Widget _upcoming() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.0.h, vertical: 7.0.w),
      color: Font_Style.middleColor,
      height: _height / 6.5, //125
      width: _width,
      child: Row(
        children: <Widget>[
          Container(
            width: _width / 4,
            child: Column(
              children: <Widget>[
                Container(
                  height: _height / 10, //80
                  width: _width / 4.0, //85
                  decoration: BoxDecoration(
                      color: Font_Style.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      Text("OCT", textAlign: TextAlign.center, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 16),),
                      Spacer(),
                      Text("12", textAlign: TextAlign.center, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, style: Font_Style().montserrat_ExtraBold(Font_Style.secondaryColor, 24),),
                      Spacer(),
                      Text("MON", textAlign: TextAlign.center, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 16),),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: _height / 38, //18
                  width: _width / 4.0, //85
                  decoration: BoxDecoration(
                      color: Font_Style.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(child: Text("2:00 PM - 3:00 PM", textAlign: TextAlign.center, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 10),)),
                ),
              ],
            ),
          ),
          VerticalDivider(
            color: Font_Style.dividerColor,
            thickness: 1.5,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: _height / 11,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Book Shop Name", textDirection: TextDirection.ltr, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis, maxLines: 1, style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 16),),
                        Spacer(),
                        Text("Bhavana colony, Center point, Bowenpally, 1-28-44/A, Plot no 103, Secunderabad, Telangana 500011", textDirection: TextDirection.ltr, textAlign: TextAlign.left, maxLines: 2, overflow: TextOverflow.ellipsis, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),),
                        Spacer(),
                      ],
                    ),
                  ),
                  Divider(
                    color: Font_Style.dividerColor,
                    thickness: 1.5,
                  ),
                  Container(
                    height: _height / 38,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Persons : 2", textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),),
                        Container(
                          height: _height / 25, //18
                          width: _width / 4.0, //85
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Font_Style.primaryColor,
                              ),
                              color: Font_Style.primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Center(child: Text("Booked", textAlign: TextAlign.center, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 16),)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
