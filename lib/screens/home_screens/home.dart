import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloonplus/screens/components/main_drawer.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

DatePickerController _controller = DatePickerController();
DateTime _selectedValue;

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _selectedValue = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Font_Style.secondaryColor,
        elevation: 3.0,
        onPressed: () {
        showSearch(
            context: context,
            delegate: BarberSearch());
        },
        icon: Icon(
          Icons.add,
          color: Font_Style.primaryColor,
          size: 24.0,
        ),
        label: Text(
          'Add Barber',
          style: Font_Style().montserrat_medium(null, 14),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        leading: Container(),
        title: Text(
          "My Barbers",
          style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 20),
        ),
        centerTitle: true,
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: InkWell(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Icon(
                        FontAwesomeIcons.bars,
                        color: Font_Style.secondaryColor,
                        size: 24.0,
                      )));
            },
          )
        ],
      ),
      endDrawer: MainDrawer(),
      body: Container(
          padding: EdgeInsets.only(
            left: 5.0.w,
            right: 5.0.w,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
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
                return _homeListItem();
              },
            ),
          )),
    );
  }

  Widget _homeListItem() {
    return Container(
      decoration: BoxDecoration(
        color: Font_Style.middleColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(2, 57, 79, 0.3),
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      height: 210.0.h,
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/barber_profile");
            },
            child: Container(
              height: 100.0.h,
              padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 7.0.w),
              child: Row(
                children: <Widget>[
                  Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage("assets/images/barber_shop.png")))),
                  SizedBox(width: 12.0.w,),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Beardo Barber Shop",
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: Font_Style()
                                .montserrat_SemiBold(Font_Style.secondaryColor, 16),
                          ),
                          Text(
                            "Bhavana colony, Center point, Bowenpally, 1-28-44/A, Plot no 103, Secunderabad, Telangana 500011",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: Font_Style()
                                .montserrat_medium(Font_Style.secondaryColor, 14),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "4.2",
                                style: Font_Style().montserrat_medium(
                                    Font_Style.secondaryColor, 14),
                              ),
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
                              Text(
                                "(15)",
                                style: Font_Style().montserrat_medium(
                                    Font_Style.secondaryColor, 14),
                              ),
                              Spacer(flex: 3,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  color: Font_Style.secondaryColor,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.7.h, horizontal: 0.7.w),
                                height: 12.0.h,
                                width: 12.0.w,
                                child: Center(
                                    child: Text(
                                  "M",
                                  style: Font_Style().montserrat_Bold(
                                      Font_Style.middleColor, 10),
                                )),
                              ),
                              Spacer(flex: 1,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  color: Font_Style.secondaryColor,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.7.h, horizontal: 0.7.w),
                                height: 12.0.h,
                                width: 12.0.w,
                                child: Center(
                                    child: Text(
                                  "F",
                                  style: Font_Style().montserrat_Bold(
                                      Font_Style.middleColor, 10),
                                )),
                              ),
                              Spacer(flex: 3,),
                              Icon(
                                Icons.directions,
                                size: 16.0.h,
                                color: Font_Style.secondaryColor,
                              ),
                              Text(
                                "5.0 KM",
                                style: Font_Style().montserrat_SemiBold(
                                    Font_Style.secondaryColor, 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: Divider(
              color: Font_Style.dividerColor,
              thickness: 1.5.h,
              height: 7.0.h,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 7.0.w),
            child: DatePicker(
              DateTime.now(),
              width: 60.0.h,
              height: 80.0.h,
              daysCount: 30,
              controller: _controller,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.black,
              selectedTextColor: Colors.white,
              inactiveDates: [
                DateTime.now().add(Duration(days: 3)),
                DateTime.now().add(Duration(days: 4)),
                DateTime.now().add(Duration(days: 7))
              ],
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BarberSearch extends SearchDelegate<String> {

  final cities = ["Hyderabad", "Secunderabad", "Guntur", "Visakhapatnam", "Ghaziabad", "New Delhi", "Patna", "Coimbatore", "Mizoram", "Ahmedabad", "Jaipur", "Jodhpur"];
  final recentCities = ["Visakhapatnam", "Ghaziabad", "New Delhi"];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.close, color: Font_Style.primaryColor, size: 18,), onPressed: () {
      query = "";
    },)];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Container(
        child: Icon(
          Icons.arrow_back,
          color: Font_Style.primaryColor,
          size: 24.0,
        ),
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentCities:cities.where((item) => item.toLowerCase().startsWith(query.toLowerCase())).toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        //leading: Icon(Icons.location_city),
        title: Center(
          child: RichText(text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: Font_Style().montserrat_Bold(null, 18),
              children: [TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: Font_Style().montserrat_medium(null, 18)
              )]
          ),),
        ),
      ),
        itemCount: suggestionList.length,),
    );
  }
  BarberSearch({
    String hintText = "Search Barber",
  }) : super(
    searchFieldLabel: hintText,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );
}
