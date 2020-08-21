import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';

class SearchHome extends StatefulWidget {
  @override
  _SearchHomeState createState() => _SearchHomeState();
}

bool _showSearchList = false;
bool _isMaleSelected = true;
bool _isFemaleSelected = true;

class _SearchHomeState extends State<SearchHome> {
  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          _showSearchList = false;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 7.0.w, right: 7.0.w, top: 5.0.h, bottom: 2.0.h),
        //color: Color.fromRGBO(2, 43, 60, 1),
        color: Font_Style.primaryColor,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  _showSearchList = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 72, 99, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(2, 57, 79, 0.3),
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Container(
                  height: 30.0.h,
                  child: TextField(
                      controller: _searchController,
                      onTap: () {
                        _showSearchList = true;
                      },
                      onChanged: (val) {
                        setState(() {
                          _showSearchList = true;
                        });
                      },
                      cursorColor: Font_Style.secondaryColor,
                      style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 16),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0.0.h),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Font_Style.secondaryColor,
                        ),
                          hintText: "Secunderabad, Tarnaka, Hyderabad",
                          hintStyle: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 16),
                          border: InputBorder.none),
                      // onChanged: onSearchTextChanged,
                    ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 3.0.h, bottom: 3.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isMaleSelected = !_isMaleSelected;
                                  });
                                },
                                child: Card(
                                  elevation: 3.0,
                                  color: _isMaleSelected ? Color.fromRGBO(3, 72, 99, 1) : Color.fromRGBO(3, 72, 99, 1).withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(3.0.h),
                                    height: 32.0.h,
                                    width: 43.0.w,
                                    child: Center(child: Text("M", style: Font_Style().montserrat_Bold(_isMaleSelected ? Font_Style.secondaryColor : Font_Style.secondaryColorWithOpacity, 14),)),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isFemaleSelected = !_isFemaleSelected;
                                  });
                                },
                                child: Card(
                                  elevation: 3.0,
                                  color: _isFemaleSelected ? Color.fromRGBO(3, 72, 99, 1) : Color.fromRGBO(3, 72, 99, 1).withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(3.0.h),
                                    height: 32.0.h,
                                    width: 43.0.w,
                                    child: Center(child: Text("F", style: Font_Style().montserrat_Bold(_isFemaleSelected ? Font_Style.secondaryColor : Font_Style.secondaryColorWithOpacity, 14),)),
                                  ),
                                ),
                              ),
                              Spacer(flex: 2,),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 8.0.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Color.fromRGBO(3, 72, 99, 1),
                                  ),
                                  height: 32.0.h,
                                  width: 114.0.w,
                                  child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Filter", style: Font_Style().montserrat_Bold(Font_Style.secondaryColorWithOpacity, 14),),
                                          Spacer(),
                                          Icon(FontAwesomeIcons.filter, color: Font_Style.secondaryColorWithOpacity, size: 14.0,),
                                        ],
                                      ),
                                  )
                              ),
                              Spacer(flex: 1,),
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 8.0.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Color.fromRGBO(3, 72, 99, 1),
                                  ),
                                  height: 32.0.h,
                                  width: 114.0.w,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Sort", style: Font_Style().montserrat_Bold(Font_Style.secondaryColorWithOpacity, 14),),
                                        Spacer(),
                                        Icon(FontAwesomeIcons.sort, color: Font_Style.secondaryColorWithOpacity, size: 14.0,),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _showSearchList ? Container(
                    height: 280.0.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                  ) : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
