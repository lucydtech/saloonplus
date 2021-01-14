import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';
import 'package:saloon_plus_barber/screens/bookings_package/appointments_home.dart';
import 'package:saloon_plus_barber/screens/bookings_package/today_package/today_list.dart';
import 'package:saloon_plus_barber/screens/profile_package/info_screens/edit_info.dart';

class BookingsHome extends StatefulWidget {
  @override
  _BookingsHomeState createState() => _BookingsHomeState();
}

class _BookingsHomeState extends State<BookingsHome>
    with SingleTickerProviderStateMixin {
  TabController _bookingsHomeTabController;
  @override
  void initState() {
    _bookingsHomeTabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _bookingsHomeTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule",
            style: FontStyle.productsansBold(Colors.white, 18)),
        actions: [
          _bookingsHomeTabController.index == 0
              ? Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditInfo()),
                      );
                    },
                    child: Icon(
                      FontAwesomeIcons.plusSquare,
                      size: 17.0.h,
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  print("Filter");
                },
                child: Icon(Icons.filter_alt)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  print("Notifications");
                },
                child: Icon(Icons.notifications)),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50.0.h,
              padding: EdgeInsets.only(top: 5.0.h),
              child: Center(
                child: TabBar(
                  indicatorColor: FontStyle.secondaryColor,
                  indicatorWeight: 0.5,
                  controller: _bookingsHomeTabController,
                  onTap: (int x) {
                    setState(() {
                      _bookingsHomeTabController.index = x;
                    });
                  },
                  labelPadding: EdgeInsets.only(
                    bottom: 7.0.h,
                  ),
                  unselectedLabelColor:
                      FontStyle.secondaryColor.withOpacity(0.7),
                  labelColor: FontStyle.secondaryColor,
                  labelStyle:
                      FontStyle.productsansBold(FontStyle.secondaryColor, 16),
                  unselectedLabelStyle: FontStyle.productsansSemiBold(
                      FontStyle.secondaryColor, 16),
                  tabs: <Widget>[
                    Text(
                      "TODAY",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      "APPOINTMENTS",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(left: 5.0.w, right: 5.0.w, bottom: 5.0.h),
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _bookingsHomeTabController,
                  children: <Widget>[TodayList(), AppointmentsHome()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
