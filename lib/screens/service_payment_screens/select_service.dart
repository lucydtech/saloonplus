import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';

class SelectService extends StatefulWidget {
  DateTime inputDate;
  String barberShopId;
  SelectService({this.inputDate, this.barberShopId});

  @override
  _SelectServiceState createState() => _SelectServiceState();
}


class _SelectServiceState extends State<SelectService> {

  DatePickerController _datePickerControllerService = DatePickerController();
  DateTime _selectedDateValueService, _nowTime, _startTime, _endTime, _selectedTime;
  int _noOfTimeCards = 0, _selectedTimeIndex = 0;
  double _height, _width;
  List<int> _selectedServicesList = [];


  @override
  void initState() {
    _nowTime = DateTime.now();
    _startTime = DateTime(2020, 11, 2, 9, 0);
    _endTime = DateTime(2020, 11, 2, 20, 0);
    if(_nowTime.hour - _startTime.hour > 0) {
      _startTime = _nowTime;
    }
    if(_startTime.minute >= 0 && _startTime.minute < 15) {
      _startTime = DateTime(_nowTime.year, _nowTime.month, _nowTime.day, _nowTime.hour, 0);
    }
    else {
      _startTime = DateTime(_nowTime.year, _nowTime.month, _nowTime.day, _nowTime.hour, (_nowTime.minute / 15).floor() * 15);
    }
    _noOfTimeCards = ((_endTime.difference(_startTime).inMinutes -15) / 15).floor();
    _selectedTime = DateTime(_startTime.year, _startTime.month, _startTime.day, _startTime.hour, _startTime.minute);
    _selectedDateValueService = widget.inputDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.white.withOpacity(0.8),
                  height: _height / 5.0.h,
                  padding:
                  EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.0.w),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 24.0.w,),
                      Container(
                          width: _height / 7.5, //140.0.w
                          height: _height / 7.5, //140.0.h
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
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w,),
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 8.0.h,),
                        Text("INFO", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
                        SizedBox(height: 8.0.h,),
                        Container(
                          padding: EdgeInsets.all(5.0.h),
                          height: _height / 7,
                          width: _width,
                          color: Font_Style.middleColor,
                          child: Text("very long description", textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 16),),
                        ),
                        SizedBox(height: 8.0.h,),
                        Text("SELECT SERVICE", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
                        SizedBox(height: 8.0.h,),
                        ListView.separated(
                            separatorBuilder: (context, index) => Container(
                              height: 1.0.h,
                              width: _width,
                              color: Font_Style.dividerColor,
                            ),
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) {
                              return _barberServicesListItem(_height, _width, i);
                            },
                            itemCount: 20
                        ),
                        SizedBox(height: 8.0.h,),
                        Text("SELECT DATE & TIME", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
                        SizedBox(height: 8.0.h,),
                        Container(
                          color: Font_Style.middleColor,
                          padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 7.0.w),
                          child: DatePicker(
                            DateTime.now(),
                            width: 60.0.h,
                            height: 80.0.h,
                            daysCount: 30,
                            controller: _datePickerControllerService,
                            initialSelectedDate: _selectedDateValueService,
                            selectionColor: Font_Style.primaryColor,
                            selectedTextColor: Font_Style.secondaryColor,
                            inactiveDates: [
                              DateTime.now().add(Duration(days: 3)),
                              DateTime.now().add(Duration(days: 4)),
                              DateTime.now().add(Duration(days: 7))
                            ],
                            onDateChange: (date) {
                              setState(() {
                                _selectedDateValueService = date;
                              });
                            },
                          ),
                        ),
                        Container(
                          color: Font_Style.middleColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                            child: Divider(
                              color: Font_Style.dividerColor,
                              thickness: 1.5.h,
                              height: 7.0.h,
                            ),
                          ),
                        ),
                        Container(
                          height: 63.0.h,
                          color: Font_Style.middleColor,
                          padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 7.0.w),
                          child: ListView.builder(
                              itemCount: _noOfTimeCards,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return _timePicker(index);
                              }
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 32.0.h),
                            child: RaisedButton(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                              padding: const EdgeInsets.all(20),
                              textColor: Font_Style.secondaryColor,
                              color: Font_Style.middleColor,
                              onPressed: () {
                                ///////////Navigate to summary page
                              },
                              child: Text('CONTINUE BOOKING', style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 16),),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _timePicker(int index) {
    DateTime displayTime = _startTime.add(Duration(minutes: 15 * (index + 1)));

    return InkWell(
      onTap: () {
        setState(() {
          _selectedTime = DateTime(_startTime.year, _startTime.month, _startTime.day, _startTime.add(Duration(minutes: 15 * (index + 1))).hour, _startTime.add(Duration(minutes: 15 * (index + 1))).minute);
          _selectedTimeIndex = index;
        });
        print(_selectedTime);
        print(_selectedTimeIndex);
      },
      child: Container(
        width: 63.0.w,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 3.5.h, vertical: 3.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: _selectedTimeIndex == index ? Font_Style.primaryColor : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${displayTime.hour}:${displayTime.minute == 0 ? "00" : displayTime.minute}", textAlign: TextAlign.center, textDirection: TextDirection.ltr, overflow: TextOverflow.clip, style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 18),),
          ],
        ),
      ),
    );
  }

  Widget _barberServicesListItem(double _height, double _width, int index) {
    return Container(
      height: _height / 10, //80.0.h
      color: Font_Style.middleColor,
      padding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 14.0.h),
      child: Row(
        children: <Widget>[
          Container(
            height: 14.0.h,
            width: 14.0.w,
            color: Font_Style.secondaryColor,
            child: Checkbox(
              value: _selectedServicesList.contains(index),
              onChanged: (val) {
                if(_selectedServicesList.contains(index)) {
                  setState(() {
                    _selectedServicesList.remove(index);
                  });
                }
                else{
                  setState(() {
                    _selectedServicesList.add(index);
                  });
                }
                print(_selectedServicesList);
              },
              activeColor: Font_Style.secondaryColor,
              checkColor: Font_Style.primaryColor,
            ),
          ),
          SizedBox(width: 18.0.w,),
          Container(
            width: _width / 2.0.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Hair Cut", textAlign: TextAlign.left, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, maxLines: 1, style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 18),),
                Spacer(),
                Text("0 Hrs 40 Min", textAlign: TextAlign.left, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, maxLines: 1, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),)
              ],
            ),
          ),
          Spacer(),
          Text("₹ 100", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 16),),
        ],
      ),
    );
  }
}
