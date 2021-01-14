import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayServiceDetails extends StatefulWidget {
  @override
  _TodayServiceDetailsState createState() => _TodayServiceDetailsState();
}

class _TodayServiceDetailsState extends State<TodayServiceDetails> {
  final _otpFormKey = GlobalKey<FormState>();
  TextEditingController _otpTextController = new TextEditingController();
  String validOTP = "1234";
  bool _isOTPLengthCorrect = false,
      _isOTPCorrect = false,
      _isServiceStopped = false;
  List<int> _selectedServicesList = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height,
        _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FontStyle.secondaryColor,
            )),
        title: Text("Service Details",
            style: FontStyle.productsansBold(Colors.white, 18)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(8.0.h),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 5.0.h),
              child: Text(
                "10:00 AM - 10:40 AM | Sat, Jan 26, 2021",
                overflow: TextOverflow.ellipsis,
                style: FontStyle.productsansMedium(Colors.white, 14),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: _isServiceStopped,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: FontStyle.middleColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h, horizontal: 8.0.w),
                          child: Column(
                            children: [
                              Text(
                                "Customer",
                                style:
                                    FontStyle.productsansBold(Colors.white, 18),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/default_dp.png'),
                                radius: MediaQuery.of(context).size.height / 22,
                                backgroundColor: FontStyle.primaryColor,
                              ),
                              SizedBox(
                                height: 6.0.h,
                              ),
                              Text(
                                "Srinivas Sharma",
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.ltr,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: FontStyle.productsansSemiBold(
                                    Colors.white, 16),
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _callPhoneNumber();
                                    },
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: Icon(
                                            Icons.call,
                                            size: 24.0.h,
                                            color: FontStyle.primaryColor,
                                          ),
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          backgroundColor: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5.0.h,
                                        ),
                                        Text(
                                          "Call",
                                          style: FontStyle.productsansSemiBold(
                                              FontStyle.secondaryColor, 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("Messages coming soon");
                                    },
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: Icon(
                                            Icons.message,
                                            size: 24.0.h,
                                            color: FontStyle.primaryColor,
                                          ),
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          backgroundColor: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5.0.h,
                                        ),
                                        Text(
                                          "Message",
                                          style: FontStyle.productsansSemiBold(
                                              FontStyle.secondaryColor, 14),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0.h),
                        child: VerticalDivider(
                          color: Colors.white54,
                          width: 0.0.w,
                          thickness: 1.0.w,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0.h, horizontal: 8.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Booking Details",
                                  style: FontStyle.productsansBold(
                                      Colors.white, 18),
                                ),
                              ),
                              Spacer(),
                              Text("Customer Type",
                                  style: FontStyle.productsansSemiBold(
                                      Colors.white70, 16)),
                              Text("Walk-In",
                                  style: FontStyle.productsansMedium(
                                      Colors.white, 14)),
                              Spacer(),
                              Text("Payment Type",
                                  style: FontStyle.productsansSemiBold(
                                      Colors.white70, 16)),
                              Text(
                                "Cash",
                                style: FontStyle.productsansMedium(
                                    Colors.white, 14),
                              ),
                              Spacer(),
                              _isOTPCorrect
                                  ? Text("Total Services",
                                      style: FontStyle.productsansSemiBold(
                                          Colors.white70, 16))
                                  : Form(
                                      key: _otpFormKey,
                                      child: TextFormField(
                                        validator: (val) {
                                          return val.length == 4
                                              ? (val == validOTP)
                                                  ? null
                                                  : "Wrong OTP"
                                              : "OTP too short ";
                                        },
                                        controller: _otpTextController,
                                        onChanged: (val) {
                                          if (val.length == 4) {
                                            setState(() {
                                              _isOTPLengthCorrect = true;
                                            });
                                          } else {
                                            setState(() {
                                              _isOTPLengthCorrect = false;
                                            });
                                          }
                                        },
                                        maxLength: 4,
                                        decoration: FontStyle.setLable(
                                            "OTP", null, context),
                                        keyboardType: TextInputType.number,
                                        cursorColor: FontStyle.secondaryColor,
                                        style: FontStyle.textFieldStyle(),
                                      )),
                              _isOTPCorrect
                                  ? Text(
                                      "5",
                                      style: FontStyle.productsansMedium(
                                          Colors.white, 14),
                                    )
                                  : Text(
                                      "Enter OTP and click Start Button",
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.ltr,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: FontStyle.productsansRegular(
                                          FontStyle.secondaryColor, 12),
                                    ),
                              Spacer(),
                              _isOTPCorrect
                                  ? Text("Service Time Slot",
                                      style: FontStyle.productsansSemiBold(
                                          Colors.white70, 16))
                                  : SizedBox(),
                              _isOTPCorrect
                                  ? RichText(
                                      text: TextSpan(
                                          text: "5:00 PM" + " - ",
                                          style: FontStyle.productsansMedium(
                                              Colors.white, 14),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: _isServiceStopped
                                                  ? "6:00 PM"
                                                  : "Servicing",
                                              style:
                                                  FontStyle.productsansMedium(
                                                      _isServiceStopped
                                                          ? Colors.white
                                                          : FontStyle
                                                              .secondaryColor,
                                                      14),
                                            )
                                          ]),
                                    )
                                  : SizedBox(),
                              Spacer(),
                              _isServiceStopped
                                  ? Text("Total Time",
                                      style: FontStyle.productsansSemiBold(
                                          Colors.white70, 16))
                                  : Container(),
                              _isServiceStopped
                                  ? Text(
                                      "01 hrs 00 mins",
                                      style: FontStyle.productsansMedium(
                                          Colors.white, 14),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: _isServiceStopped
                        ? Text(
                            "Payment Summary",
                            style: FontStyle.productsansBold(Colors.white, 18),
                          )
                        : Text(
                            "Select all the customer services : ",
                            style:
                                FontStyle.productsansMedium(Colors.white, 16),
                          ),
                  ),
                ),
                !_isServiceStopped
                    ? Flexible(
                        child: ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) {
                              return _selectServicesListItem(
                                  _height, _width, i);
                            },
                            itemCount: 10),
                      )
                    : paymentSummary(),
                !_isOTPCorrect
                    ? SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.white,
                          padding: EdgeInsets.all(15),
                          textColor: _isOTPLengthCorrect
                              ? FontStyle.primaryColor
                              : Colors.white,
                          color:
                              _isOTPLengthCorrect ? Colors.green : Colors.grey,
                          onPressed: () {
                            if (_otpFormKey.currentState.validate()) {
                              if (_selectedServicesList.length != 0) {
                                setState(() {
                                  _isOTPCorrect = true;
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Please select atleast 1 service to Start!",
                                    // backgroundColor: FontStyle.secondaryColor,
                                    fontSize: 16,
                                    textColor: Colors.white,
                                    gravity: ToastGravity.BOTTOM,
                                    toastLength: Toast.LENGTH_LONG);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please enter OTP from customer!",
                                  // backgroundColor: Colors.teal,
                                  fontSize: 16,
                                  textColor: Colors.white,
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG);
                            }
                          },
                          child: Text(
                            "START SERVICE",
                            style: FontStyle.productsansBold(Colors.white, 14),
                          ),
                        ),
                      )
                    : !_isServiceStopped
                        ? SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.white,
                              padding: EdgeInsets.all(15),
                              textColor: _isOTPCorrect
                                  ? FontStyle.primaryColor
                                  : Colors.white,
                              color: _isOTPCorrect ? Colors.red : Colors.grey,
                              onPressed: () {
                                if (_selectedServicesList.length != 0) {
                                  setState(() {
                                    _isServiceStopped = true;
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Please select atleast 1 service to Stop!",
                                      // backgroundColor: FontStyle.secondaryColor,
                                      fontSize: 16,
                                      textColor: Colors.white,
                                      gravity: ToastGravity.BOTTOM,
                                      toastLength: Toast.LENGTH_LONG);
                                }
                              },
                              child: Text(
                                "STOP SERVICE",
                                style:
                                    FontStyle.productsansBold(Colors.white, 14),
                              ),
                            ),
                          )
                        : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentSummary() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Total Services :",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "Service Time Slot :",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "Total Time :",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "Cost of Services :",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "Amount paid :",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "Amount Due",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "Coupon Applied :",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "Order Total :",
                style: FontStyle.productsansBold(Colors.teal, 16.0),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "5",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "5:00 PM - 6:00 PM",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "01 hrs 00 mins",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "₹ 601.69",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "₹ 114.41",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "₹ 487.28",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "₹ -40.00",
                style: FontStyle.productsansRegular(Colors.white, 14.5),
              ),
              SizedBox(
                height: 12.0.h,
              ),
              Text(
                "₹ 447.28",
                style: FontStyle.productsansBold(Colors.teal, 16.0),
              ),
            ],
          )
        ],
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
        color: FontStyle.middleColor,
        padding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 14.0.h),
        child: Row(
          children: <Widget>[
            Container(
              height: 14.0.h,
              width: 14.0.w,
              color: FontStyle.secondaryColor,
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
                activeColor: FontStyle.secondaryColor,
                checkColor: FontStyle.primaryColor,
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
                    style: FontStyle.productsansBold(Colors.white, 18),
                  ),
                  Spacer(),
                  Text(
                    "0 Hrs 40 Min",
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: FontStyle.productsansMedium(Colors.white, 14),
                  )
                ],
              ),
            ),
            Spacer(),
            Text(
              "₹100",
              style: FontStyle.productsansSemiBold(Colors.white, 16),
            ),
          ],
        ),
      ),
    );
  }

  _callPhoneNumber() async {
    const number = '7702366842';
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
