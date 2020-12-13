import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geocoder/geocoder.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:saloon_plus_barber/locationData/LocationData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloon_plus_barber/screens/profile_package/services.dart';

class EditInfo extends StatefulWidget {
  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final profileUpdateFormKey = GlobalKey<FormState>();

  LocationData _locationData;
  List<String> stateList = new List<String>();

  String _state, _district;
  TextEditingController _addLine1Controller = new TextEditingController();
  TextEditingController _addLine2Controller = new TextEditingController();
  TextEditingController _postalCodeController = new TextEditingController();
  TextEditingController _contactController = new TextEditingController();

  static DateTime nowDate = DateTime.now();

  DateTime _sunOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 9, 0, 0, 0, 0);
  DateTime _sunClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 18, 0, 0, 0, 0);
  DateTime _monOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 9, 0, 0, 0, 0);
  DateTime _monClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 18, 0, 0, 0, 0);
  DateTime _tueOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 9, 0, 0, 0, 0);
  DateTime _tueClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 18, 0, 0, 0, 0);
  DateTime _wedOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 9, 0, 0, 0, 0);
  DateTime _wedClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 18, 0, 0, 0, 0);
  DateTime _thuOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 9, 0, 0, 0, 0);
  DateTime _thuClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 18, 0, 0, 0, 0);
  DateTime _friOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 9, 0, 0, 0, 0);
  DateTime _friClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 18, 0, 0, 0, 0);
  DateTime _satOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 9, 0, 0, 0, 0);
  DateTime _satClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 18, 0, 0, 0, 0);

  DateTime _sunBreakOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 13, 0, 0, 0, 0);
  DateTime _sunBreakClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 14, 0, 0, 0, 0);
  DateTime _monBreakOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 13, 0, 0, 0, 0);
  DateTime _monBreakClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 14, 0, 0, 0, 0);
  DateTime _tueBreakOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 13, 0, 0, 0, 0);
  DateTime _tueBreakClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 14, 0, 0, 0, 0);
  DateTime _wedBreakOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 13, 0, 0, 0, 0);
  DateTime _wedBreakClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 14, 0, 0, 0, 0);
  DateTime _thuBreakOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 13, 0, 0, 0, 0);
  DateTime _thuBreakClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 14, 0, 0, 0, 0);
  DateTime _friBreakOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 13, 0, 0, 0, 0);
  DateTime _friBreakClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 14, 0, 0, 0, 0);
  DateTime _satBreakOpen =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 13, 0, 0, 0, 0);
  DateTime _satBreakClose =
      DateTime(nowDate.year, nowDate.month, nowDate.day, 14, 0, 0, 0, 0);

  bool isSun = false,
      isMon = false,
      isTue = false,
      isWed = false,
      isThu = false,
      isFri = false,
      isSat = false;


  FocusNode addressFocusNode = FocusNode(), contactFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _locationData = new LocationData();
    _locationData.getStateList().then((value) => setState((){stateList = value;}));
  }

  @override
  Widget build(BuildContext context) {

    final String fNArgs = ModalRoute.of(context).settings.arguments;
    print(fNArgs);
    switch(fNArgs) {
      case "a" :
        addressFocusNode.requestFocus();
        break;
      case "c" :
        contactFocusNode.requestFocus();
        break;
      case "t" :
        break;
      default:
        addressFocusNode.requestFocus();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Font_Style.middleColor,
        title: Text(
          "Edit Barber Info",
          style: Font_Style.productsans_medium(Colors.white, 18),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Font_Style.secondaryColor,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: InkWell(
                    onTap: () {
                      if(profileUpdateFormKey.currentState.validate() && _state  != null && _district != null && _contactController.text.length == 10) {
                        _getCoordinatesFromAddress();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.save,
                          color: Font_Style.secondaryColor,
                        ),
                        SizedBox(
                          width: 3.0.w,
                        ),
                        Text(
                          "save",
                          style: Font_Style.productsans_medium(
                              Font_Style.secondaryColor, 16),
                        )
                      ],
                    ),
                  ))),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: profileUpdateFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Address",
                    style: Font_Style.productsans_Bold(Colors.white, 16),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Font_Style.middleColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: EdgeInsets.only(
                        top: 8.0.h, bottom: 15.0.h, left: 8.0.w, right: 8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          focusNode: addressFocusNode,
                          controller: _addLine1Controller,
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.white,
                          style:
                              Font_Style.productsans_medium(Colors.white, null),
                          decoration: Font_Style.setLableUnderline(
                              "Address ine 1", null, context, Colors.white70),
                        ),
                        TextFormField(
                          validator: (val) {
                            return val.length > 7
                                ? null
                                : "Address line 2 is too short";
                          },
                          controller: _addLine2Controller,
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.white,
                          style:
                              Font_Style.productsans_medium(Colors.white, null),
                          decoration: Font_Style.setLableUnderline(
                              "Address Line 2", null, context, Colors.white70),
                        ),
                        profileDropDownEntry(
                            stateList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            _state,
                            "Select State", (String newValue) {
                          setState(() {
                            _state = newValue;
                            _district = null;
                          });
                        }),
                        profileDropDownEntry(
                            _locationData
                                .getDistrict(_state)
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            _district,
                            "Select District",
                                (String newValue) {
                              setState(() {
                            _district = newValue;
                          });
                        }),
                        TextFormField(
                          validator: (val) {
                            return val.length == 6
                                ? null
                                : "Postal Code is invalid";
                          },
                          controller: _postalCodeController,
                          maxLength: 6,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style:
                              Font_Style.productsans_medium(Colors.white, null),
                          decoration: Font_Style.setLableUnderline(
                              "Postal Code", null, context, Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Text(
                    "Contact",
                    style: Font_Style.productsans_Bold(Colors.white, 16),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Font_Style.middleColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: EdgeInsets.only(
                        top: 8.0.h, bottom: 15.0.h, left: 8.0.w, right: 8.0.w),
                    child: TextField(
                      focusNode: contactFocusNode,
                      controller: _contactController,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      style: Font_Style.productsans_medium(Colors.white, null),
                      decoration: Font_Style.setLableUnderline(
                          "Contact Number", null, context, Colors.white70),
                    ),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Text(
                    "Timings",
                    style: Font_Style.productsans_Bold(Colors.white, 16),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Font_Style.middleColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    padding: EdgeInsets.only(
                        top: 8.0.h, bottom: 15.0.h, right: 8.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        toggleSwitch(isSun, "Sunday", () => isSun = !isSun,
                            _sunOpen, _sunClose),
                        toggleSwitch(isMon, "Monday", () => isMon = !isMon,
                            _monOpen, _monClose),
                        toggleSwitch(isTue, "Tuesday", () => isTue = !isTue,
                            _tueOpen, _tueClose),
                        toggleSwitch(isWed, "Wednesday", () => isWed = !isWed,
                            _wedOpen, _wedClose),
                        toggleSwitch(isThu, "Thursday", () => isThu = !isThu,
                            _thuOpen, _thuClose),
                        toggleSwitch(isFri, "Friday", () => isFri = !isFri,
                            _friOpen, _friClose),
                        toggleSwitch(isSat, "Saturday", () => isSat = !isSat,
                            _satOpen, _satClose),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  isSun || isMon || isTue || isWed || isThu || isFri || isSat
                      ? Text(
                          "Break Timings",
                          style: Font_Style.productsans_Bold(Colors.white, 16),
                        )
                      : Container(),
                  isSun || isMon || isTue || isWed || isThu || isFri || isSat
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Font_Style.middleColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          padding: EdgeInsets.only(
                              top: 8.0.h, bottom: 15.0.h, right: 8.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              breakTiming(isSun, "Sunday", () => isSun = !isSun,
                                  _sunBreakOpen, _sunBreakClose),
                              breakTiming(isMon, "Monday", () => isMon = !isMon,
                                  _monBreakOpen, _monBreakClose),
                              breakTiming(
                                  isTue,
                                  "Tuesday",
                                  () => isTue = !isTue,
                                  _tueBreakOpen,
                                  _tueBreakClose),
                              breakTiming(
                                  isWed,
                                  "Wednesday",
                                  () => isWed = !isWed,
                                  _wedBreakOpen,
                                  _wedBreakClose),
                              breakTiming(
                                  isThu,
                                  "Thursday",
                                  () => isThu = !isThu,
                                  _thuBreakOpen,
                                  _thuBreakClose),
                              breakTiming(isFri, "Friday", () => isFri = !isFri,
                                  _friBreakOpen, _friBreakClose),
                              breakTiming(
                                  isSat,
                                  "Saturday",
                                  () => isSat = !isSat,
                                  _satBreakOpen,
                                  _satBreakClose),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _getCoordinatesFromAddress() async {
    final query = "${_addLine1Controller.text} ${_addLine2Controller.text} ${_postalCodeController.text} ${_district.toString()} ${_state.toString()}";
    print(query);
      //  "plot no. 22, house no: 6-522-110, New Bowenpally, Srinivas Nagar Colony, Seetharampuram, Hyderabad, Telangana";
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    print("hhhhhhhhhhhhhhhhhhhh");
    print("${first.featureName} : ${first.coordinates}");

    /*final coordinates = new Coordinates(1.10, 45.50);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");*/
  }

  Widget profileDropDownEntry(List<DropdownMenuItem<String>> items,
      String dropdownValue, String hint, Function(String) onChange) {
    return Theme(
      data: new ThemeData(
          canvasColor: Font_Style.primaryColor),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0.h),
        child: DropdownButtonFormField<String>(
          value: dropdownValue,
          hint: Text(
            hint,
            style: Font_Style.productsans_medium(Colors.white70, 14),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: Font_Style.secondaryColor,
            size: 24.0,
          ),
          iconSize: 24,
          elevation: 16,
          style: Font_Style.productsans_medium(Colors.white, 14),
          isExpanded: true,
          onChanged: onChange,
          items: items,
          decoration: InputDecoration(
            hintText: "",
    enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white70))
          ),
        ),
      ),
    );
  }

  Widget toggleSwitch(bool value, String day, Function fun, DateTime openDate,
      DateTime closeDate) {
    return Container(
      padding: EdgeInsets.only(right: 8.0.w),
      child: Row(
        children: <Widget>[
          Switch(
            value: value,
            activeColor: Font_Style.secondaryColor,
            onChanged: (value) {
              setState(() {
                fun();
              });
            },
          ),
          Text(
            day,
            style: Font_Style.productsans_medium(
                value ? Colors.white : Colors.white70, 14),
          ),
          Spacer(),
          value
              ? InkWell(
                  onTap: () {
                    selectTime(openDate, day, "o", "");
                  },
                  child: Text(
                    openDate.toString().substring(11, 16),
                    style: Font_Style.productsans_medium(
                        Font_Style.secondaryColor, 14),
                  ))
              : Container(),
          value
              ? Text(
                  " - ",
                  style: Font_Style.productsans_medium(Colors.white, 14),
                )
              : Container(),
          value
              ? InkWell(
                  onTap: () {
                    selectTime(closeDate, day, "c", "");
                  },
                  child: Text(
                    closeDate.toString().substring(11, 16),
                    style: Font_Style.productsans_medium(
                        Font_Style.secondaryColor, 14),
                  ))
              : Container(),
        ],
      ),
    );
  }

  void selectTime(DateTime dateTime, String day, String l, String br) {
    DatePicker.showTimePicker(context, showTitleActions: true,
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      setState(() {
        dateTime = date;
        _satClose = date;
        switch (day) {
          case 'Sunday':
            if (br == "") {
              if (l == "o")
                _sunOpen = date;
              else if (l == "c") _sunClose = date;
            } else {
              if (l == "o")
                _sunBreakOpen = date;
              else if (l == "c") _sunBreakClose = date;
            }
            break;
          case 'Monday':
            if (br == "") {
              if (l == "o")
                _monOpen = date;
              else if (l == "c") _monClose = date;
            } else {
              if (l == "o")
                _monBreakOpen = date;
              else if (l == "c") _monBreakClose = date;
            }
            break;
          case 'Tuesday':
            if (br == "") {
              if (l == "o")
                _tueOpen = date;
              else if (l == "c") _tueClose = date;
            } else {
              if (l == "o")
                _tueBreakOpen = date;
              else if (l == "c") _tueBreakClose = date;
            }
            break;
          case 'Wednesday':
            if (br == "") {
              if (l == "o")
                _wedOpen = date;
              else if (l == "c") _wedClose = date;
            } else {
              if (l == "o")
                _wedBreakOpen = date;
              else if (l == "c") _wedBreakClose = date;
            }
            break;
          case 'Thursday':
            if (br == "") {
              if (l == "o")
                _thuOpen = date;
              else if (l == "c") _thuClose = date;
            } else {
              if (l == "o")
                _thuBreakOpen = date;
              else if (l == "c") _thuBreakClose = date;
            }
            break;
          case 'Friday':
            if (br == "") {
              if (l == "o")
                _friOpen = date;
              else if (l == "c") _friClose = date;
            } else {
              if (l == "o")
                _friBreakOpen = date;
              else if (l == "c") _friBreakClose = date;
            }
            break;
          case 'Saturday':
            if (br == "") {
              if (l == "o")
                _satOpen = date;
              else if (l == "c") _satClose = date;
            } else {
              if (l == "o")
                _satBreakOpen = date;
              else if (l == "c") _satBreakClose = date;
            }
            break;

          default:
            if (br == "") {
              if (l == "o")
                _monOpen = date;
              else if (l == "c") _monClose = date;
            } else {
              if (l == "o")
                _monBreakOpen = date;
              else if (l == "c") _monBreakClose = date;
            }
            break;
        }
      });
    }, currentTime: DateTime.now());
  }

  Widget breakTiming(bool value, String day, Function fun, DateTime openDate,
      DateTime closeDate) {
    return value
        ? Container(
            margin: EdgeInsets.only(bottom: 24.0.h),
            padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
            child: Row(
              children: <Widget>[
                Text(
                  day,
                  style: Font_Style.productsans_medium(
                      value ? Colors.white : Colors.white70, 14),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      selectTime(openDate, day, "o", "b");
                    },
                    child: Text(
                      openDate.toString().substring(11, 16),
                      style: Font_Style.productsans_medium(
                          Font_Style.secondaryColor, 14),
                    )),
                Text(
                  " - ",
                  style: Font_Style.productsans_medium(Colors.white, 14),
                ),
                InkWell(
                    onTap: () {
                      selectTime(closeDate, day, "c", "b");
                    },
                    child: Text(
                      closeDate.toString().substring(11, 16),
                      style: Font_Style.productsans_medium(
                          Font_Style.secondaryColor, 14),
                    )),
              ],
            ),
          )
        : Container();
  }
}
