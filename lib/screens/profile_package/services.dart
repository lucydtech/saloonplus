import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';

TextEditingController _nameController = new TextEditingController();
TextEditingController _priceController = new TextEditingController();
TextEditingController _timeController = new TextEditingController();
TextEditingController _descController = new TextEditingController();

final serviceUpdateFormKey = GlobalKey<FormState>();

Widget barberServicesTab(BuildContext context) {
  var _height = MediaQuery.of(context).size.height;
  var _width = MediaQuery.of(context).size.width;

  return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        servicesShowDialog(context);
      },
      child: Icon(
        Icons.add,
        size: 24.0,
        color: FontStyle.primaryColor,
      ),
      backgroundColor: FontStyle.secondaryColor,
    ),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: FontStyle.dividerColor,
                height: 1.0.h,
              ),
          physics: ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, i) {
            return _barberServicesListItem(context, _height, _width);
          },
          itemCount: 20),
    ),
  );
}

Widget _barberServicesListItem(
    BuildContext context, double _height, double _width) {
  return InkWell(
    onTap: () {
      servicesShowDialog(context);
    },
    child: Container(
      width: _width,
      height: _height / 8.5,
      color: FontStyle.middleColor,
      padding:
          EdgeInsets.only(left: 8.0.w, right: 8.0.w, top: 5.0.h, bottom: 8.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Hair Cut",
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: FontStyle.productsansBold(Colors.white, 18),
              ),
              Text(
                "₹ 100",
                style: FontStyle.productsansSemiBold(Colors.white, 16),
              ),
            ],
          ),
          Text(
            "0 hrs 40 min",
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: FontStyle.productsansMedium(Colors.white70, 14),
          ),
          SizedBox(height: 8.0.h),
          Text(
            "Soo much description that you can't measure it. Very large description. You probably can't read this description, so just don't waste your time please.",
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: FontStyle.productsansMedium(Colors.white70, 14),
          )
        ],
      ),
    ),
  );
}

void servicesShowDialog(BuildContext context) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.h),
          height: 300.0.h,
          child: Material(
            child: Form(
              key: serviceUpdateFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) {
                        return val.length > 2
                            ? null
                            : "Service name is too short";
                      },
                      controller: _nameController,
                      maxLength: 25,
                      keyboardType: TextInputType.text,
                      cursorColor: FontStyle.primaryColor,
                      style: FontStyle.productsansMedium(
                          FontStyle.primaryColor, null),
                      decoration: FontStyle.setLableUnderline("Service Name",
                          null, context, FontStyle.primaryColor),
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.length != 0 ? null : "Invalid price";
                      },
                      controller: _priceController,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      cursorColor: FontStyle.primaryColor,
                      style: FontStyle.productsansMedium(
                          FontStyle.primaryColor, null),
                      decoration: FontStyle.setLableUnderline(
                          "Price", null, context, FontStyle.primaryColor),
                    ),
                    InkWell(
                      onTap: () {
                        DatePicker.showTimePicker(context,
                            showTitleActions: true, onChanged: (date) {
                          print('change $date in time zone ' +
                              date.timeZoneOffset.inHours.toString());
                        }, onConfirm: (date) {
                          _timeController.text =
                              date.timeZoneOffset.toString().substring(11, 16);
                          print('confirm $date');
                        }, currentTime: DateTime.now());
                      },
                      child: TextField(
                        controller: _timeController,
                        enabled: false,
                        maxLength: 300,
                        keyboardType: TextInputType.text,
                        cursorColor: FontStyle.primaryColor,
                        style: FontStyle.productsansMedium(
                            FontStyle.primaryColor, null),
                        decoration: FontStyle.setLableUnderline("Select Time",
                            null, context, FontStyle.primaryColor),
                      ),
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.length > 5
                            ? null
                            : "Description is too short";
                      },
                      controller: _descController,
                      maxLength: 300,
                      maxLines: 3,
                      minLines: 2,
                      keyboardType: TextInputType.text,
                      cursorColor: FontStyle.primaryColor,
                      style: FontStyle.productsansMedium(
                          FontStyle.primaryColor, null),
                      decoration: FontStyle.setLableUnderline(
                          "Description", null, context, FontStyle.primaryColor),
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          textColor: Colors.white,
                          color: Colors.grey,
                          child: Text(
                            "DELETE",
                            style: FontStyle.productsansBold(Colors.white, 12),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            if (serviceUpdateFormKey.currentState.validate()) {
                              Navigator.of(context).pop();
                            }
                          },
                          textColor: Colors.white,
                          color: FontStyle.secondaryColor,
                          child: Text(
                            "SAVE",
                            style: FontStyle.productsansBold(
                                FontStyle.primaryColor, 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          margin: EdgeInsets.only(bottom: 50.0.h, left: 12.0.w, right: 12.0.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
