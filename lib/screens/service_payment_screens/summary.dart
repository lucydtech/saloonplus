import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';

class Summary extends StatefulWidget {
  DateTime dateSelected, timeSelected;
  Summary({this.dateSelected, this.timeSelected});

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final upiIdFormKey = GlobalKey<FormState>();
  TextEditingController upiIdController = new TextEditingController();

  DateTime _nowTime = DateTime.now();
  double _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    final Summary _summaryArgs = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Font_Style.primaryColor,
        elevation: 0.0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, size: 24.0, color: Font_Style.secondaryColor,)),
        title: Text("View Order Summary", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*Text("View Order Details", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
                SizedBox(height: 12.0.h,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 15.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Font_Style.secondaryColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Order date", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Order #", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Order total", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("${_nowTime.day}/${_nowTime.month}/${_nowTime.year}", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("404-2058999-0744347", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("₹ 710.00 (6 services)", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12.0.h,),*/
                Text("Selected Saloon", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
                SizedBox(height: 12.0.h,),
                Container(
                  color: Colors.white.withOpacity(0.8),
                  height: _height / 6.0.h,
                  padding:
                  EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 12.0.w),
                  child: Row(
                    children: <Widget>[
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
                SizedBox(height: 12.0.h,),
                Text("Selected Services", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
                SizedBox(height: 12.0.h,),
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
                      return _summaryServicesListItem(_height, _width, i);
                    },
                    itemCount: 6
                ),
                SizedBox(height: 12.0.h,),
                Text("Order Summary", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
                SizedBox(height: 12.0.h,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Font_Style.secondaryColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Total Services:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Service Date:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Service Time Slot:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Estimated Time:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Cost of Services:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Total before Tax:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Tax:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Total:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Coupon Applied:", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("Order Total:", style: Font_Style().montserrat_Bold(Colors.teal, 16.0),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("6", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text(_summaryArgs.dateSelected == null ? "undefined date" : "${_summaryArgs.dateSelected.day}-${_summaryArgs.dateSelected.month}-${_summaryArgs.dateSelected.year}", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text(_summaryArgs.timeSelected == null? "undefined time" : "${_summaryArgs.timeSelected.hour > 12 ? _summaryArgs.timeSelected.hour - 12 : _summaryArgs.timeSelected.hour} : ${_summaryArgs.timeSelected.minute == 0 ? "00" : _summaryArgs.timeSelected.minute} ${_summaryArgs.timeSelected.hour > 12 ? "PM" : "AM"}", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("0 Hrs 40 Min", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("₹ 601.69", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("₹ 601.69", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("₹ 114.41", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("₹ 750.00", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("₹ -40.00", style: Font_Style().montserrat_Regular(Font_Style.secondaryColor, 14.5),),
                          SizedBox(height: 12.0.h,),
                          Text("₹ 710.00", style: Font_Style().montserrat_Bold(Colors.teal, 16.0),),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12.0.h,),
                Text("Select Payment Method", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 19),),
                SizedBox(height: 12.0.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    upiPaymentItem("assets/images/Google-Pay-Logo.png", "Google Pay"),
                    upiPaymentItem("assets/images/phone-pe.png", "Phone Pe"),
                    upiPaymentItem("assets/images/paytm-logo.png", "Paytm"),
                  ],
                ),
                SizedBox(height: 12.0.h,),
                Align(
                  alignment: Alignment.center,
                    child: Text("Or", textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 14),)),
                SizedBox(height: 12.0.h,),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/add_card");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 12.0.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Font_Style.secondaryColor,),
                        color: Font_Style.secondaryColor.withOpacity(0.8)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("+ Add New Card", style: Font_Style().montserrat_SemiBold(Font_Style.primaryColor, 16),),
                          SizedBox(height: 2.0.h,),
                          Padding(
                              padding: EdgeInsets.only(left: 13.0.w),
                              child: Text("Send and pay via Cards", style: Font_Style().montserrat_medium(Font_Style.primaryColor, 8),))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _summaryServicesListItem(double _height, double _width, int index) {
    return Container(
      height: _height / 10, //80.0.h
      color: Font_Style.middleColor,
      padding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 14.0.h),
      child: Row(
        children: <Widget>[
          Container(
            height: 12.0.h,
            width: 12.0.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Font_Style.primaryColor,
              border: Border.all(color: Font_Style.secondaryColor, width: 2.5.w),
            ),
          ),
          SizedBox(width: 12.0.w,),
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

  Widget upiPaymentItem(String image, String title) {
    return InkWell(
      onTap: () {
        upiIdDialog(title);
      },
      child: Container(
        margin: EdgeInsets.only(left: 7.0.w, right: 7.0.w),
        height: 60.0.h,
        width: 60.0.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Image.asset(image, height: 40.0.h, width: 40.0.w, fit: BoxFit.fill,)),
            Spacer(),
            Text(title, style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 10),),
          ],
        ),
      ),
    );
  }

  void upiIdDialog(String title) {
    showDialog(context: context, builder: (BuildContext context) =>
        Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20.0.h, bottom: 20.0.h, left: 20.0.w, right: 20.0.w),
            height: 250.0.h,
            width: 350.0.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Add ${title} UPI Id", style: Font_Style().montserrat_Bold(null, 16),),
                Spacer(flex: 20,),
                Text("Enter your UPI ID HERE :", style: Font_Style().montserrat_SemiBold(Font_Style.primaryColor, 16),),
                Spacer(flex: 20,),
                Form(
                  key: upiIdFormKey,
                  child: TextFormField(
                    validator: (val){
                      return RegExp(r"^\w+@\w+$").hasMatch(val) ?
                      null : "Please enter a valid UPI ID";
                    },
                    controller: upiIdController,
                    maxLength: 35,
                    decoration:  InputDecoration(
                      counterText: "",
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Font_Style.primaryColor,
                    style:  Font_Style().montserrat_medium(Font_Style.primaryColor, null),
                  ),
                ),
                Spacer(flex: 30,),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
                    padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 15.0.w),
                    textColor: Font_Style.secondaryColor,
                    color: Font_Style.middleColor,
                    onPressed: () {
                      if(upiIdFormKey.currentState.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('PROCEED', style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 16),),
                  ),
                ),
                Spacer(flex: 10,),
              ],
            ),
          ),
        )
    );
  }
}