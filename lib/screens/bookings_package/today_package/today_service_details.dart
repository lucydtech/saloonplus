import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
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

  @override
  Widget build(BuildContext context) {
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
                                  FontStyle.productsansBold(Colors.white, 20),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _callPhoneNumber();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.call,
                                      size: 24.0.h,
                                      color: FontStyle.primaryColor,
                                    ),
                                    radius:
                                        MediaQuery.of(context).size.height / 30,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print("Messages coming soon");
                                  },
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.message,
                                      size: 24.0.h,
                                      color: FontStyle.primaryColor,
                                    ),
                                    radius:
                                        MediaQuery.of(context).size.height / 30,
                                    backgroundColor: Colors.white,
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
                                style:
                                    FontStyle.productsansBold(Colors.white, 20),
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
                              style:
                                  FontStyle.productsansMedium(Colors.white, 14),
                            ),
                            Spacer(),
                            _isOTPCorrect
                                ? Text("Number of services",
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
                                ? Text("Service start time",
                                    style: FontStyle.productsansSemiBold(
                                        Colors.white70, 16))
                                : Container(),
                            _isOTPCorrect
                                ? Text(
                                    "5:00 PM",
                                    style: FontStyle.productsansMedium(
                                        Colors.white, 14),
                                  )
                                : Container(),
                            Spacer(),
                            _isServiceStopped
                                ? Text("Service stop time",
                                    style: FontStyle.productsansSemiBold(
                                        Colors.white70, 16))
                                : Container(),
                            _isServiceStopped
                                ? Text(
                                    "6:00 PM",
                                    style: FontStyle.productsansMedium(
                                        Colors.white, 14),
                                  )
                                : Container()
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
                  child: Text(
                    "Select all the customer services : ",
                    style: FontStyle.productsansMedium(Colors.white, 16),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
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
                        color: _isOTPLengthCorrect
                            ? FontStyle.secondaryColor
                            : Colors.grey,
                        onPressed: () {
                          if (_otpFormKey.currentState.validate()) {
                            setState(() {
                              _isOTPCorrect = true;
                            });
                          }
                        },
                        child: Text(
                          "START SERVICE",
                          style: FontStyle.productsansBold(
                              _isOTPLengthCorrect
                                  ? FontStyle.primaryColor
                                  : Colors.white,
                              14),
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
                            color: _isOTPCorrect
                                ? FontStyle.secondaryColor
                                : Colors.grey,
                            onPressed: () {
                              setState(() {
                                _isServiceStopped = true;
                              });
                            },
                            child: Text(
                              "STOP SERVICE",
                              style: FontStyle.productsansBold(
                                  _isOTPCorrect
                                      ? FontStyle.primaryColor
                                      : Colors.white,
                                  14),
                            ),
                          ),
                        )
                      : Container(),
              _isServiceStopped
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: Colors.white54,
                          ),
                          Text(
                            "Total Amount : ₹100",
                            style:
                                FontStyle.productsansMedium(Colors.white, 16),
                          ),
                          Text(
                            "Amount paid : ₹0",
                            style:
                                FontStyle.productsansMedium(Colors.white, 16),
                          ),
                          Text(
                            "Amount due : ₹100",
                            style:
                                FontStyle.productsansMedium(Colors.white, 16),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  _callPhoneNumber() async {
    const number = '7702366842';
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
