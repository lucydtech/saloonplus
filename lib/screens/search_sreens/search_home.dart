import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w, top: 5.0.h, bottom: 2.0.h),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _showSearchList = true;
                  });
                },
                child: Container(
                  height: 30.0.h,
                  decoration: BoxDecoration(
                    color: Font_Style.middleColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(2, 57, 79, 0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
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
                        contentPadding: EdgeInsets.symmetric(vertical: -2.1.h),
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
                          padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w, top: 5.0.h, bottom: 7.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isMaleSelected = !_isMaleSelected;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: _isMaleSelected ? Font_Style.middleColor : Font_Style.middleColor.withOpacity(0.5),
                                  ),
                                  height: 32.0.h,
                                  width: 43.0.w,
                                  child: Center(child: Text("M", style: Font_Style().montserrat_Bold(_isMaleSelected ? Font_Style.secondaryColor : Font_Style.secondaryColorWithOpacity, 14),)),
                                ),
                              ),
                              Spacer(flex: 1,),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isFemaleSelected = !_isFemaleSelected;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: _isFemaleSelected ? Font_Style.middleColor : Font_Style.middleColor.withOpacity(0.5),
                                  ),
                                  height: 32.0.h,
                                  width: 43.0.w,
                                  child: Center(child: Text("F", style: Font_Style().montserrat_Bold(_isFemaleSelected ? Font_Style.secondaryColor : Font_Style.secondaryColorWithOpacity, 14),)),
                                ),
                              ),
                              Spacer(flex: 2,),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 8.0.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Font_Style.middleColor,
                                  ),
                                  height: 32.0.h,
                                  width: 114.0.w,
                                  child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Filter", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 14),),
                                          Spacer(),
                                          Icon(FontAwesomeIcons.filter, color: Font_Style.secondaryColor, size: 14.0,),
                                        ],
                                      ),
                                  )
                              ),
                              Spacer(flex: 1,),
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 3.0.h, horizontal: 8.0.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Font_Style.middleColor,
                                  ),
                                  height: 32.0.h,
                                  width: 114.0.w,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Sort", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 14),),
                                        Spacer(),
                                        Icon(FontAwesomeIcons.sort, color: Font_Style.secondaryColor, size: 14.0,),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 0.0.w),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Font_Style.middleColor,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                  thickness: 1.0.h,
                                  color: Font_Style.dividerColor,
                                ),
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: 10,
                                itemBuilder: (context, i) {
                                  return _searchHomeListItem();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _showSearchList ? Container(
                    padding: EdgeInsets.only(left: 7.0.w, right: 7.0.w,),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 5.0.h, bottom: 10.0.h),
                      height: 300.0.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Font_Style.middleColor,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Font_Style.dividerColor,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Spacer(),
                      InkWell(
                        onTap: (){
                          FocusScope.of(context).requestFocus(new FocusNode());
                          setState(() {
                            _showSearchList = false;
                          });
                        },
                        child: Container(
                          width: 70.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: Font_Style.secondaryColor, borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                                "Search",
                                style: Font_Style().montserrat_Bold(Font_Style.middleColor, 16)
                            ),
                          ),
                        ),
                      ),
                        ],
                      ),
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

  Widget _searchHomeListItem() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/barber_profile");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 8.0.w),
        height: MediaQuery.of(context).size.height / 8.5, //90.0.h
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 73.0.w,
                height: 73.0.h,
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
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Beardo Barber Shop",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 16),),
                    Text(
                      "Bhavana colony, Center point, Bowenpally, 1-28-44/A, Plot no 103, Secunderabad, Telangana 500011",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("4.2", style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),),
                        RatingBar(
                          initialRating: 4.2,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 14.0,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            size: 1.0,
                            color: Colors.amber,
                          ),
                        ),
                        Text("(15)", style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),),
                        Spacer(),
                        Card(
                          elevation: 3.0,
                          color: Font_Style.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 0.7.w),
                            height: 12.0.h,
                            width: 12.0.w,
                            child: Center(child: Text("M", style: Font_Style().montserrat_Bold(Font_Style.middleColor, 10),)),
                          ),
                        ),
                        Card(
                          elevation: 3.0,
                          color: Font_Style.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 0.7.h, horizontal: 0.7.w),
                            height: 12.0.h,
                            width: 12.0.w,
                            child: Center(child: Text("F", style: Font_Style().montserrat_Bold(Font_Style.middleColor, 10),)),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.directions, size: 16.0.h, color: Font_Style.secondaryColor,),
                        Text("5.0 KM", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 14),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
