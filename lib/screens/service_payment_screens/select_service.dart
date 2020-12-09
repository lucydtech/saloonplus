import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';
import 'package:saloonplus/screens/service_payment_screens/summary.dart';

class SelectService extends StatefulWidget {
  DateTime inputDate;
  String barberShopId;

  SelectService({this.inputDate, this.barberShopId});

  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  Map<String, bool> values = {
    'foo': true,
    'bar': false,
  };

  DatePickerController _datePickerControllerService = DatePickerController();
  DateTime _selectedDateValueService,
      _nowTime,
      _startTime,
      _endTime,
      _calculatedStartTime,
      _selectedTime;
  int _noOfTimeCards = 0, _selectedTimeIndex = 0;
  double _height, _width;
  List<int> _selectedServicesList = [];
  bool _isServiceAvailable = true;

  @override
  void initState() {
    _selectedDateValueService = widget.inputDate;
    _nowTime = DateTime.now();
    _startTime = DateTime(_nowTime.year, _nowTime.month, _nowTime.day, 9, 0);
    _calculatedStartTime = _startTime;
    _endTime = DateTime(_nowTime.year, _nowTime.month, _nowTime.day, 10, 30);

    _calculateStartTime();

    _calculateService();

    _selectedTime = _calculatedStartTime;

    //_datePickerControllerService.animateToDate(_selectedDateValueService, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);

    super.initState();
  }

  void _calculateStartTime() {
    setState(() {
      if (_nowTime.isAfter(_calculatedStartTime) && _nowTime.isBefore(_endTime) && _selectedDateValueService.day == _nowTime.day) {
        _calculatedStartTime = _nowTime;
      }
      else {
        _calculatedStartTime = _startTime;
      }
      if (_calculatedStartTime.minute >= 0 && _calculatedStartTime.minute < 15) {
        _calculatedStartTime = DateTime(
            _calculatedStartTime.year, _calculatedStartTime.month, _calculatedStartTime.day, _calculatedStartTime.hour, 0);
      } else {
        _calculatedStartTime = DateTime(_calculatedStartTime.year, _calculatedStartTime.month, _calculatedStartTime.day,
            _calculatedStartTime.hour, (_calculatedStartTime.minute / 15).ceil() * 15);
      }
    });
    print(_calculatedStartTime);
    _calculateNoOfCards();
  }

  void _calculateNoOfCards() {
    setState(() {
      _noOfTimeCards = ((_endTime.difference(_calculatedStartTime).inMinutes) / 15).floor();
    });
    print(_endTime.difference(_calculatedStartTime).inMinutes);
    print((_endTime.difference(_calculatedStartTime).inMinutes) / 15);
    print(_noOfTimeCards);
  }

  void _calculateService() {
    if(_selectedDateValueService.day == _nowTime.day && _nowTime.isAfter(_endTime) || _noOfTimeCards <= 0 || _noOfTimeCards == null) {
      setState(() {
        _isServiceAvailable = false;
      });
    }
    else {
      setState(() {
        _isServiceAvailable = true;
      });
    }
    print(_isServiceAvailable);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Builder(
      builder: (context) => SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.white.withOpacity(0.8),
                  height: _height / 5.0.h,
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0.h, horizontal: 12.0.w),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 24.0.w,
                      ),
                      Container(
                          width: _height / 7.5, //140.0.w
                          height: _height / 7.5, //140.0.h
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/barber_shop.png")))),
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
                        child: Icon(
                          Icons.arrow_back,
                          size: 26.0,
                          color: Font_Style.primaryColor,
                        )))
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                ),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Text(
                      "INFO",
                      style: Font_Style()
                          .montserrat_Bold(Font_Style.secondaryColor, 19),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0.h),
                      height: _height / 7,
                      width: _width,
                      color: Font_Style.middleColor,
                      child: Text(
                        "very long description",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        style: Font_Style()
                            .montserrat_medium(Font_Style.secondaryColor, 16),
                      ),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Text(
                      "SELECT SERVICE",
                      style: Font_Style()
                          .montserrat_Bold(Font_Style.secondaryColor, 19),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
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
                          return _selectServicesListItem(_height, _width, i);
                        },
                        itemCount: 20),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Text(
                      "SELECT DATE & TIME",
                      style: Font_Style()
                          .montserrat_Bold(Font_Style.secondaryColor, 19),
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Container(
                      color: Font_Style.middleColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 7.0.h, horizontal: 7.0.w),
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
                            _nowTime = DateTime.now();
                            _selectedDateValueService = date;
                            _calculateStartTime();
                            _calculateService();
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
                      height: 55.0.h,
                      color: Font_Style.middleColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 7.0.h, horizontal: 7.0.w),
                      child: (_isServiceAvailable)
                          ? ListView.builder(
                          itemCount: _noOfTimeCards,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return _timePicker(index);
                          })
                          : Container(
                        width: _width,
                        child: Center(child: Row(
                          children: <Widget>[
                            Icon(Icons.info_outline, color: Colors.red, size: 24.0,),
                            SizedBox(width: 8.0.w,),
                            Flexible(child: Text("Currently, services are not available on the selected date.", textAlign: TextAlign.left, textDirection: TextDirection.ltr, overflow: TextOverflow.clip, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),))
                          ],
                        )
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 32.0.h),
                        child: RaisedButton(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 15.0.h),
                          textColor: Font_Style.secondaryColor,
                          color: Font_Style.middleColor,
                          onPressed: () {
                            if (_selectedServicesList.length > 0 && _isServiceAvailable)
                              Navigator.pushNamed(context, "/summary", arguments: Summary(dateSelected: _selectedDateValueService, timeSelected: _selectedTime,),);
                            else
                              showSnackBar(context);
                          },
                          child: Text(
                            'CONTINUE BOOKING',
                            style: Font_Style().montserrat_SemiBold(
                                Font_Style.secondaryColor, 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget _timePicker(int index) {
    DateTime displayTime = _calculatedStartTime.add(Duration(minutes: 15 * (index)));
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTime = _calculatedStartTime.add(Duration(minutes: 15 * (index)));
          _selectedTimeIndex = index;
        });
        print(_selectedTime);
        print(_selectedTimeIndex);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 3.5.h, vertical: 3.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: _selectedTimeIndex == index ? Font_Style.primaryColor : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${displayTime.hour > 12 ? displayTime.hour - 12 : displayTime.hour}:${displayTime.minute == 0 ? "00" : displayTime.minute} ${displayTime.hour > 12 ? "PM" : "AM"}",
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              overflow: TextOverflow.clip,
              style: Font_Style()
                  .montserrat_SemiBold(Font_Style.secondaryColor, 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectServicesListItem(double _height, double _width, int index) {
    return InkWell(
      onTap: () {
        if (_selectedServicesList.contains(index)) {
          setState(() {
            _selectedServicesList.remove(index);
          });
        } else {
          setState(() {
            _selectedServicesList.add(index);
          });
        }
        print(_selectedServicesList);
      },
      child: Container(
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
                  if (_selectedServicesList.contains(index)) {
                    setState(() {
                      _selectedServicesList.remove(index);
                    });
                  } else {
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
            SizedBox(
              width: 18.0.w,
            ),
            Container(
              width: _width / 2.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Hair Cut",
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Font_Style()
                        .montserrat_Bold(Font_Style.secondaryColor, 18),
                  ),
                  Spacer(),
                  Text(
                    "0 Hrs 40 Min",
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Font_Style()
                        .montserrat_medium(Font_Style.secondaryColor, 14),
                  )
                ],
              ),
            ),
            Spacer(),
            Text(
              "₹100",
              style:
                  Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 16),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(context) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Font_Style.secondaryColor,
      content: GestureDetector(
        child: Container(
          height: 37.0.h,
          width: 390.0.w,
          child: Row(
            children: <Widget>[
              Icon(Icons.info_outline, color: Colors.red,),
              SizedBox(width: 8.0.w,),
              Flexible(child: Text("${_isServiceAvailable ? "Please select at least 1 service to continue." : "Currently, services are not available on the selected date."}", textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_medium(Font_Style.primaryColor, 14),)),
            ],
          ),
        ),
      ),
    ));
  }
}
