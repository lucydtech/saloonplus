import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class BarberInfoTab extends StatefulWidget {
  @override
  _BarberInfoTabState createState() => _BarberInfoTabState();
}

class _BarberInfoTabState extends State<BarberInfoTab> {
  String _barberShopId = "barber shop id";
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
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: Font_Style.middleColor,
      width: _width,
      padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 7.0.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Address",
                  style: Font_Style.productsans_Bold(Colors.white, 16),
                ),
                Icon(Icons.edit, size: 22.0, color: Font_Style.secondaryColor,)
              ],
            ),

            SizedBox(
              height: 5.0.h,
            ),
            Text(
              "so much addrss ADDRESS so much addrss ADDRESS so much addrss ADDRESS so much addrss ADDRESS so much addrss ADDRESS",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: Font_Style.productsans_medium(Colors.white70, 14),
            ),
            Divider(
              color: Font_Style.dividerColor,
              thickness: 1.0.h,
              height: 25.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Contact",
                  style: Font_Style.productsans_Bold(Colors.white, 16),
                ),
                Icon(Icons.edit, size: 22.0, color: Font_Style.secondaryColor,),
              ],
            ),
            SizedBox(
              height: 8.0.w,
            ),
            Text("+91  9905648571", style: Font_Style.productsans_medium(Colors.white70, 14),),
            Divider(
              color: Font_Style.dividerColor,
              thickness: 1.0.h,
              height: 25.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Timings",
                  style: Font_Style.productsans_Bold(
                      Colors.white, 16),
                ),
                Icon(Icons.edit, size: 22.0, color: Font_Style.secondaryColor,)
              ],
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Text(
              "Monday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style:
                  Font_Style.productsans_medium(Colors.white70, 14),
            ),
            Text(
              "Tuesday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style:
              Font_Style.productsans_medium(Colors.white70, 14),
            ),
            Text(
              "Wednesday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style:
              Font_Style.productsans_medium(Colors.white70, 14),
            ),
            Text(
              "Thursday : 9 am - 1 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style:
              Font_Style.productsans_medium(Colors.white70, 14),
            ),
            Text(
              "Friday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style:
              Font_Style.productsans_medium(Colors.white70, 14),
            ),
            Text(
              "Saturday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style:
              Font_Style.productsans_medium(Colors.white70, 14),
            ),
            Text(
              "Sunday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style:
              Font_Style.productsans_medium(Colors.white70, 14),
            ),
            Divider(
              color: Font_Style.dividerColor,
              thickness: 1.0.h,
              height: 25.0.h,
            ),
            Text(
              "My Address",
              style: Font_Style.productsans_Bold(Colors.white, 16),
            ),
            SizedBox(
              height: 8.0.h,
            ),
            Container(
              height: _height / 1.5.h, //60.0.h
              width: _width,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  _googleMapsController.complete(controller);
                },
                initialCameraPosition: _camPosition,
                scrollGesturesEnabled: true,
                tiltGesturesEnabled: true,
                trafficEnabled: false,
                compassEnabled: true,
                rotateGesturesEnabled: true,
                //myLocationEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                liteModeEnabled: true,
                mapType: MapType.normal,
                markers: {
                  Marker(
                      markerId: _markerId, position: LatLng(17.3850, 78.4867)),
                },
                //zoomGesturesEnabled: true,
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
                            style: Font_Style.productsans_Bold(null, 16)),
                        SizedBox(height: 16.0),
                        RatingBar.builder(
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
                        SizedBox(
                          height: 16.0.h,
                        ),
                        Container(
                          height: 150.0.h,
                          child: Form(
                            key: _ratingFormKey,
                            child: TextFormField(
                              validator: (val) {
                                return val.length == 0
                                    ? "Feedback can't be empty"
                                    : (val.length < 5
                                        ? "Please provide a detailed feedback"
                                        : null);
                              },
                              controller: _ratingFeedbackController,
                              onChanged: (text) {
                                _ratingCounterText = text.length.toString();
                                setState(() {
                                  _ratingFocusNode.addListener(() {
                                    if (text.length == 100) {}
                                    if (text.isEmpty) {
                                      if (_ratingFocusNode.hasFocus) {
                                        _ratingShowPrefix = false;
                                      } else {
                                        _ratingShowPrefix = true;
                                      }
                                    } else {
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
                              style: Font_Style.productsans_Light(
                                  Font_Style.primaryColor, 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 12.w,
                                    top: 12.h,
                                    bottom: 30.h,
                                    right: 12.w),
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
                                    color: _ratingFeedbackIsEmpty
                                        ? Colors.red
                                        : Colors.grey, //#070920
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: _ratingFeedbackIsEmpty
                                        ? Colors.red
                                        : Colors.grey, //#070920
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
                              child: Text(
                                "Maybe Later",
                                style:
                                    Font_Style.productsans_SemiBold(null, 14),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                if (_ratingFormKey.currentState.validate())
                                  Navigator.of(context).pop();
                              },
                              child: Text(
                                "Submit",
                                style:
                                    Font_Style.productsans_SemiBold(null, 14),
                              ),
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
