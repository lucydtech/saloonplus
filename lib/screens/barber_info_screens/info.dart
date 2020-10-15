import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloonplus/ThemeData/fontstyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Widget barberInfoTab(BuildContext context) {

  var _height = MediaQuery.of(context).size.height;
  var _width = MediaQuery.of(context).size.width;

  Completer<GoogleMapController> _googleMapsController = Completer();

  CameraPosition _camPosition = CameraPosition(
    target: LatLng(17.3850, 78.4867),
    zoom: 14.4746,
  );

  return Container(
    child: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Font_Style.middleColor,
          ),
          height: _height / 11.5.h, //60.0.h
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 3.0.w),
          margin: EdgeInsets.symmetric(vertical: 5.0.h,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.book, color: Font_Style.secondaryColor, size: 26,),
                  Spacer(),
                  Text("Book", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 14),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_circle, color: Font_Style.secondaryColor, size: 26,),
                  Spacer(),
                  Text("Add", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 14),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.remove_circle, color: Font_Style.secondaryColor, size: 26,),
                  Spacer(),
                  Text("Remove", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 14),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.rate_review, color: Font_Style.secondaryColor, size: 26,),
                  Spacer(),
                  Text("Rate", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 14),)
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Font_Style.middleColor,
          ),
          height: _height / 2.8.h, //60.0.h
          width: _width,
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 12.0.w),
          margin: EdgeInsets.symmetric(vertical: 5.0.h,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: _height / 11.0.h,
                width: _width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("ADDRESS :", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 16),),
                    //SizedBox(height: 5.0.h,),
                    Spacer(),
                    Text("so much address so much address so much address so much address so much address so much address so much address so much address so much address so much address so much address", overflow: TextOverflow.ellipsis, maxLines: 3, textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),),
                    Spacer(),
                  ],
                ),
              ),
              Divider(
                color: Font_Style.secondaryColor,
              ),
              Container(
                height: _height / 11.0.h,
                width: _width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("CONTACT : 999999999", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 16),),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.call, color: Font_Style.secondaryColor, size: 28.0.h,),
                              SizedBox(height: 3.0.h,),
                              Text("Call", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 12),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.message, color: Font_Style.secondaryColor, size: 28.0.h,),
                              SizedBox(height: 3.0.h,),
                              Text("Message", style: Font_Style().montserrat_SemiBold(Font_Style.secondaryColor, 12),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Divider(
                color: Font_Style.secondaryColor,
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
                        Text("Timings :", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 16),),
                        Container(
                            height: 25.0.h,
                            width: 70.0.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                              color: Font_Style.primaryColor,
                            ),
                            child: Center(child: Text("OPEN", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor.withOpacity(0.8), 16),))),
                      ],
                    ),
                    Spacer(),
                    Text("MON - FRI : 9:00 AM - 7:00 PM", overflow: TextOverflow.ellipsis, maxLines: 3, textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),),
                    SizedBox(height: 5.0.h,),
                    Text("SAT - SUN : 9:00 AM - 3:00 PM", overflow: TextOverflow.ellipsis, maxLines: 3, textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_medium(Font_Style.secondaryColor, 14),),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          height: _height / 6.0.h, //60.0.h
          width: _width,
          margin: EdgeInsets.symmetric(vertical: 5.0.h,),
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
  );
}

Future<void> openGoogleMaps({double latitude = 17.3850, double longitude = 78.4867}) async {
String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
if (await canLaunch(googleUrl)) {
await launch(googleUrl);
}
else {
throw 'Could not open the map.';
}
}

launchAnyMap({String lat = "17.3850", String long = "78.4867"}) async{
  var mapSchema = 'geo:$lat,$long';
  if (await canLaunch(mapSchema)) {
    await launch(mapSchema);
  } else {
    throw 'Could not launch $mapSchema';
  }
}