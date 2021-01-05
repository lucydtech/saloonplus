import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class BarberInfoTab extends StatefulWidget {
  @override
  _BarberInfoTabState createState() => _BarberInfoTabState();
}

class _BarberInfoTabState extends State<BarberInfoTab> {
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
      color: FontStyle.middleColor,
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
                  style: FontStyle.productsansBold(Colors.white, 16),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("edit_info", arguments: "a");
                    },
                    child: Icon(
                      Icons.edit,
                      size: 22.0,
                      color: FontStyle.secondaryColor,
                    ))
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
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Divider(
              color: FontStyle.dividerColor,
              thickness: 1.0.h,
              height: 25.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Contact",
                  style: FontStyle.productsansBold(Colors.white, 16),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("edit_info", arguments: "c");
                    },
                    child: Icon(
                      Icons.edit,
                      size: 22.0,
                      color: FontStyle.secondaryColor,
                    )),
              ],
            ),
            SizedBox(
              height: 8.0.w,
            ),
            Text(
              "+91  9905648571",
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Divider(
              color: FontStyle.dividerColor,
              thickness: 1.0.h,
              height: 25.0.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Timings",
                  style: FontStyle.productsansBold(Colors.white, 16),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("edit_info", arguments: "t");
                    },
                    child: Icon(
                      Icons.edit,
                      size: 22.0,
                      color: FontStyle.secondaryColor,
                    ))
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
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Text(
              "Tuesday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Text(
              "Wednesday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Text(
              "Thursday : 9 am - 1 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Text(
              "Friday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Text(
              "Saturday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Text(
              "Sunday : 9 am - 12 pm, 2 pm - 6 pm",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: FontStyle.productsansMedium(Colors.white70, 14),
            ),
            Divider(
              color: FontStyle.dividerColor,
              thickness: 1.0.h,
              height: 25.0.h,
            ),
            Text(
              "Address on Map",
              style: FontStyle.productsansBold(Colors.white, 16),
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
}
