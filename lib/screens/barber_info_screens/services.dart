import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';

Widget barberServicesTab(BuildContext context) {

  var _height = MediaQuery.of(context).size.height;
  var _width = MediaQuery.of(context).size.width;

  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 1.0.h,
          width: _width,
          color: Font_Style.dividerColor,
        ),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) {
          return _barberServicesListItem(_height, _width);
        },
        itemCount: 20),
  );
}

Widget _barberServicesListItem(double _height, double _width) {
  return Container(
    height: _height / 10, //80.0.h
    color: Font_Style.middleColor,
    padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 14.0.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: _width / 1.3.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hair Cut", textAlign: TextAlign.left, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, maxLines: 1, style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 22),),
              Spacer(),
              Text("0 Hrs 40 Min", textAlign: TextAlign.left, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, maxLines: 1, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),)
            ],
          ),
        ),
        Text("₹ 100", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 18),),
      ],
    ),
  );
}