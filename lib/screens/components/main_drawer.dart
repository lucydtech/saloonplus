import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(top: 20.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        ////////////////////////
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                border: Border.all(width: 1,style: BorderStyle.solid,color: Font_Style.primaryColor.withOpacity(0.2)),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/userprofiledefault.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                            //child: showImage(),
                          ),

                          Padding(
                            padding:  EdgeInsets.only(left: 58.w,top: 58.h),
                            child: Container(
                              width: 22.h,
                              height: 22.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Font_Style.primaryColor
                              ),
                              child: Center(
                                child: Icon(Icons.edit,size: 18.h,color: Colors.white,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 18.0.w,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Mr. John", style: Font_Style().montserrat_Bold(null, 20.0),),
                          SizedBox(height: 4.h,),
                          Text("john25@gmail.com", style: Font_Style().montserrat_Regular(null, 16.0),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.0.h,),
              Container(
                padding: EdgeInsets.only(left: 30.0.w, right: 30.0.w),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0.h,),
                    _list_title("Your Wallets", Icons.account_balance_wallet, ""),
                    _list_title("Bookings", Icons.calendar_today, ""),
                    _list_title("Explore", Icons.explore, ""),
                    _list_title("Learn More", FontAwesomeIcons.bookReader, ""),
                  ],
                ),
              ),
              Spacer(),
              _buttonWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _list_title(String title,IconData icon, String route){
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(icon,size: 24,color: Font_Style.primaryColor.withOpacity(0.7),),
              SizedBox(width: 25.0.w,),
              Text(title,style: Font_Style().montserrat_Bold(Font_Style.primaryColor, 14.0),),
            ],),
          SizedBox(
            height: 15.0.h,
          ),
          Container(
            width: 345.w,
            height: 1.5.h,
            color: Font_Style.secondaryColor.withOpacity(0.20),
          ),
          SizedBox(
            height: 15.0.h,
          )
        ],
      ),
    );
  }

  Widget _buttonWidget(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          /////////////////////////
        },
        child: Container(
          width: 320.w,
          decoration: BoxDecoration(
            color: Font_Style.primaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          height: 58.h,
          child: Center(
            child: Text(
                "Logout",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}
