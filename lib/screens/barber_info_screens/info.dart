import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class BarberInfoTab extends StatefulWidget {
  @override
  _BarberInfoTabState createState() => _BarberInfoTabState();
}

class _BarberInfoTabState extends State<BarberInfoTab> {

  bool _ratingShowPrefix = true;
  String _ratingCounterText = "0";
  FocusNode _ratingFocusNode = FocusNode();
  TextEditingController _ratingFeedbackController;
    bool _ratingFeedbackIsEmpty = false;
  final _ratingFormKey = GlobalKey<FormState>();

  bool _isBarberAdded = false;
  static final MarkerId _markerId = MarkerId("shopLocationMarkerId");

  Completer<GoogleMapController> _googleMapsController = Completer();

  CameraPosition _camPosition = CameraPosition(
    target: LatLng(17.3850, 78.4867),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: Font_Style.middleColor,
              ),
              height: _height / 12.0.h, //60.0.h
              padding:
                  EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.book,
                        color: Font_Style.secondaryColor,
                        size: 28,
                      ),
                      Spacer(),
                      Text(
                        "Book",
                        style: Font_Style()
                            .montserrat_SemiBold(Font_Style.secondaryColor, 14),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isBarberAdded = !_isBarberAdded;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          !_isBarberAdded
                              ? Icons.add_circle
                              : Icons.remove_circle,
                          color: Font_Style.secondaryColor,
                          size: 28,
                        ),
                        Spacer(),
                        Text(
                          !_isBarberAdded ? "Add" : "Remove",
                          style: Font_Style().montserrat_SemiBold(
                              Font_Style.secondaryColor, 14),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _showRatingDialog(context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.rate_review,
                          color: Font_Style.secondaryColor,
                          size: 28,
                        ),
                        Spacer(),
                        Text(
                          "Rate",
                          style: Font_Style().montserrat_SemiBold(
                              Font_Style.secondaryColor, 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Font_Style.dividerColor,
              height: 5.0.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: Font_Style.middleColor,
              ),
              height: _height / 2.8.h,
              //60.0.h
              width: _width,
              padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 7.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: _height / 11.0.h,
                    width: _width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Address :",
                          style: Font_Style()
                              .montserrat_Bold(Font_Style.secondaryColor, 16),
                        ),
                        Spacer(),
                        Text(
                          "so much address so much address so much address so much address so much address so much address so much address so much address so much address so much address so much address",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          style: Font_Style()
                              .montserrat_medium(Font_Style.secondaryColor, 14),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Font_Style.dividerColor,
                    thickness: 1.0.h,
                  ),
                  Container(
                    height: _height / 16.0.h,
                    width: _width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Contact :",
                          style: Font_Style()
                              .montserrat_Bold(Font_Style.secondaryColor, 16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                          child: InkWell(
                            onTap: () {
                              _callPhoneNumber();
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.call,
                                  color: Font_Style.secondaryColor,
                                  size: 28.0.h,
                                ),
                                SizedBox(
                                  height: 3.0.h,
                                ),
                                Text(
                                  "Call",
                                  style: Font_Style().montserrat_SemiBold(
                                      Font_Style.secondaryColor, 12),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.message,
                                color: Font_Style.secondaryColor,
                                size: 28.0.h,
                              ),
                              SizedBox(
                                height: 3.0.h,
                              ),
                              Text(
                                "Message",
                                style: Font_Style().montserrat_SemiBold(
                                    Font_Style.secondaryColor, 12),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Divider(
                    color: Font_Style.dividerColor,
                    thickness: 1.0.h,
                  ),
                  Container(
                    height: _height / 11.0.h,
                    width: _width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Timings :",
                              style: Font_Style().montserrat_Bold(
                                  Font_Style.secondaryColor, 16),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3.0.h, horizontal: 5.0.w),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                  color: Font_Style.primaryColor,
                                ),
                                child: Center(
                                    child: Text(
                                  "OPEN NOW",
                                  style: Font_Style().montserrat_Bold(
                                      Font_Style.secondaryColor
                                          .withOpacity(0.8),
                                      16),
                                ))),
                          ],
                        ),
                        Spacer(),
                        Text(
                          "MON - FRI : 9:00 AM - 7:00 PM",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          style: Font_Style()
                              .montserrat_medium(Font_Style.secondaryColor, 14),
                        ),
                        SizedBox(
                          height: 5.0.h,
                        ),
                        Text(
                          "SAT - SUN : 9:00 AM - 3:00 PM",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          style: Font_Style()
                              .montserrat_medium(Font_Style.secondaryColor, 14),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Font_Style.dividerColor,
              height: 5.0.h,
            ),
            Container(
              height: _height / 1.5.h, //60.0.h
              width: _width,
              child: Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _googleMapsController.complete(controller);
                    },
                    initialCameraPosition: _camPosition,
                    //scrollGesturesEnabled: true,
                    //tiltGesturesEnabled: true,
                    trafficEnabled: false,
                    //compassEnabled: true,
                    //rotateGesturesEnabled: true,
                    //myLocationEnabled: true,
                    mapType: MapType.normal,
                    markers: {
                      Marker(
                          markerId: _markerId,
                          position: LatLng(17.3850, 78.4867)),
                    },
                    //zoomGesturesEnabled: true,
                  ),
                  InkWell(
                      onTap: () {
                        //openGoogleMaps(17.3850, 78.4867);
                        launchAnyMap(lat: "17.3850", long: "78.4867");
                      },
                      child: Container()),
                ],
              ),
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

  Future<void> openGoogleMaps(
      {double latitude = 17.3850, double longitude = 78.4867}) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  launchAnyMap({String lat = "17.3850", String long = "78.4867"}) async {
    var mapSchema = 'geo:$lat,$long';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  void _showRatingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: 5.0.w, right: 5.0.w, top: 60.0.h, bottom: 5.0.h),
                  margin: EdgeInsets.only(top: 60.0.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Barber Shop Name",
                            style: Font_Style().montserrat_Bold(null, 16)),
                        SizedBox(height: 16.0),
                        RatingBar(
                          initialRating: 3,
                          itemCount: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                return Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.red,
                                );
                              case 1:
                                return Icon(
                                  Icons.sentiment_dissatisfied,
                                  color: Colors.redAccent,
                                );
                              case 2:
                                return Icon(
                                  Icons.sentiment_neutral,
                                  color: Colors.amber,
                                );
                              case 3:
                                return Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.lightGreen,
                                );
                              case 4:
                                return Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Colors.green,
                                );
                              default:
                                return Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                );
                            }
                          },
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(height: 16.0.h,),
                        Container(
                          height: 150.0.h,
                          child: Form(
                            key: _ratingFormKey,
                            child: TextFormField(
                              validator: (val){
                                return val.length == 0 ? "Feedback can't be empty" : (val.length < 5 ? "Please provide a detailed feedback" : null);
                              },
                              controller: _ratingFeedbackController,
                              onChanged: (text) {
                                _ratingCounterText = text.length.toString();
                                setState(() {
                                  _ratingFocusNode.addListener(() {
                                    if (text.length == 100) {}
                                    if (text.isEmpty) {
                                      if(_ratingFocusNode.hasFocus) {
                                        _ratingShowPrefix = false;
                                      }
                                      else{
                                        _ratingShowPrefix = true;
                                      }
                                    }
                                    else {
                                      _ratingShowPrefix = false;
                                    }
                                  });
                                });
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100),
                              ],
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              expands: true,
                              textInputAction: TextInputAction.newline,
                              textAlignVertical: TextAlignVertical.top,
                              cursorColor: Font_Style.primaryColor,
                              style: Font_Style().montserrat_Light(Font_Style.primaryColor, 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 12.w,top: 12.h,bottom:30.h,right: 12.w),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                    color: Colors.grey, //#070920
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: _ratingFeedbackIsEmpty ? Colors.red : Colors.grey, //#070920
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: _ratingFeedbackIsEmpty ? Colors.red : Colors.grey, //#070920
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Maybe Later", style: Font_Style().montserrat_SemiBold(null, 14),),
                            ),
                            FlatButton(
                              onPressed: () {
                                if(_ratingFormKey.currentState.validate())
                                  Navigator.of(context).pop();
                              },
                              child: Text("Submit", style: Font_Style().montserrat_SemiBold(null, 14),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width / 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage("assets/images/barber_shop.png"),
                    radius: 60.0,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
