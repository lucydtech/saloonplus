import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';

Widget barberReviewsTav(BuildContext context) {
  var _height = MediaQuery
      .of(context)
      .size
      .height;
  var _width = MediaQuery
      .of(context)
      .size
      .width;

  return Column(
    children: <Widget>[
      Container(
        height: _height / 15,
        color: Font_Style.middleColor,
        padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 5.0.w),
        child: Row(
          children: <Widget>[
            Text("Overall Rating", style: Font_Style().montserrat_Bold(
                Font_Style.secondaryColor, 18),),
            Spacer(),
            Text("4.2", style: Font_Style().montserrat_SemiBold(
                Font_Style.secondaryColor, 14),),
            RatingBar(
              initialRating: 4.2,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 14.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) =>
                  Icon(
                    Icons.star,
                    size: 1.0,
                    color: Colors.amber,
                  ),
            ),
            Text("(15)", style: Font_Style().montserrat_SemiBold(
                Font_Style.secondaryColor, 14),),
          ],
        ),
      ),
      SizedBox(height: 12.0.h,),
      Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Container(
                      height: 1.0.h,
                      width: _width,
                      color: Font_Style.dividerColor,
                    ),
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, i) {
                  return _barberReviewsListItem(context, _height, _width, i);
                },
                itemCount: 20),
          )
      ),
    ],
  );
}

Widget _barberReviewsListItem(BuildContext context, double _height, double _width, int index) {
  return InkWell(
    onTap: () {
      print(index);
      showDialog(context);
    },
    child: Container(
      height: _height / 9.0.h, //80.0.h
      width: _width,
      color: Font_Style.middleColor,
      padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
      child: Row(
        children: <Widget>[
          Container(
              width: 70.0.w,
              height: 70.0.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/barber_shop.png")
                  )
              )
          ),
          SizedBox(width: 12.0.w,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: _width / 2.2,
                          child: Text("Raju Raju Raju Raju Raju Raju", textDirection: TextDirection.ltr, textAlign: TextAlign.left, overflow: TextOverflow.clip, maxLines: 1, style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 16),)),
                      RatingBar(
                        initialRating: 4.2,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 14.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) =>
                            Icon(
                              Icons.star,
                              size: 1.0,
                              color: Colors.amber,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0.h,),
                  Text("15/10/2020", textAlign: TextAlign.left, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, maxLines: 1, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 12),),
                 Spacer(),
                 Text("Satisfied with the service Satisfied with the serviceSatisfied with the serviceSatisfied with the serviceSatisfied with the serviceSatisfied with the service", textDirection: TextDirection.ltr, textAlign: TextAlign.left, overflow: TextOverflow.ellipsis, maxLines: 1, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),)
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void showDialog(BuildContext context) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 300.0.h,
          child: Column(
            children: <Widget>[
              Container(
                height: 80.0.h,
                padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 7.0.w),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 70.0.w,
                        height: 70.0.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/barber_shop.png")
                            )
                        )
                    ),
                    SizedBox(width: 12.0.w,),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                    child: Material(child: Text("Raju Raju Raju Raju Raju Raju", textDirection: TextDirection.ltr, textAlign: TextAlign.left, overflow: TextOverflow.clip, maxLines: 1, style: Font_Style().montserrat_SemiBold(Font_Style.primaryColor, 18),))),
                                RatingBar(
                                  initialRating: 4.2,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 16.0,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) =>
                                      Icon(
                                        Icons.star,
                                        size: 1.0,
                                        color: Colors.amber,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0.h,),
                            Material(child: Text("15/10/2020", textAlign: TextAlign.left, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, maxLines: 1, style: Font_Style().montserrat_medium(Font_Style.primaryColor, 14),)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Font_Style.primaryColor,
                thickness: 1.0,
              ),
              Expanded(
                child: SingleChildScrollView(child: Material(child: Padding(
                  padding: EdgeInsets.all(7.0.h),
                    child: Text("very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review very long review ", style: Font_Style().montserrat_Regular(Font_Style.primaryColor, 16),)))),
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: 50.0.h, left: 12.0.w, right: 12.0.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}