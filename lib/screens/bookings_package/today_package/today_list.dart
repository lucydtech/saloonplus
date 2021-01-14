import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';

class TodayList extends StatefulWidget {
  @override
  _TodayListState createState() => _TodayListState();
}

class _TodayListState extends State<TodayList> {
  DateTime now = DateTime.now();
  bool _isBarberOnline = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: SpeedDial(
      //   animatedIcon: AnimatedIcons.menu_close,
      //   animatedIconTheme:
      //       IconThemeData(size: 22, color: FontStyle.primaryColor),
      //   backgroundColor: FontStyle.secondaryColor,
      //   visible: true,
      //   curve: Curves.bounceIn,
      //   children: [
      //     SpeedDialChild(
      //         child: Icon(
      //           Icons.more_time,
      //           color: FontStyle.secondaryColor,
      //         ),
      //         backgroundColor: FontStyle.middleColor,
      //         onTap: () {
      //           print("Add Customer");
      //         },
      //         label: 'Add Customer',
      //         labelStyle: FontStyle.productsansMedium(Colors.white, 16),
      //         labelBackgroundColor: FontStyle.middleColor),
      //     SpeedDialChild(
      //         child: Icon(
      //           Icons.notifications,
      //           color: FontStyle.secondaryColor,
      //         ),
      //         backgroundColor: FontStyle.middleColor,
      //         onTap: () {
      //           print("Notifications");
      //         },
      //         label: 'Notifications',
      //         labelStyle: FontStyle.productsansMedium(Colors.white, 16),
      //         labelBackgroundColor: FontStyle.middleColor),
      //   ],
      // ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "14 Jan, 2021",
          style: FontStyle.productsansMedium(Colors.white, 16),
        ),
        actions: [
          toggleSwitch(
              _isBarberOnline, () => _isBarberOnline = !_isBarberOnline),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("Add customers");
        },
        label: Text(
          "Add Customers",
          style: FontStyle.productsansMedium(FontStyle.primaryColor, 14),
        ),
        icon: Icon(
          FontAwesomeIcons.plusCircle,
          color: FontStyle.primaryColor,
          size: 18.0.h,
        ),
        backgroundColor: FontStyle.secondaryColor,
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext cntxt, int index) {
          return todayListItem(index);
        },
      )),
    );
  }

  Widget todayListItem(int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("today_service_details");
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 8.5,
        color: index % 2 == 0 ? FontStyle.middleColor : Colors.red,
        padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 3.0.w),
        margin: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 1.0.w),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/barber_shop.png'),
              radius: MediaQuery.of(context).size.height / 24,
              backgroundColor: FontStyle.primaryColor,
            ),
            SizedBox(
              width: 5.0.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "Srinivas Sharma",
                          overflow: TextOverflow.ellipsis,
                          style: FontStyle.productsansBold(
                              FontStyle.secondaryColor, 16),
                        ),
                      ),
                      Text(
                        "10:00 AM",
                        overflow: TextOverflow.ellipsis,
                        style: FontStyle.productsansMedium(
                            FontStyle.secondaryColor, 14),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "Hair cut",
                          overflow: TextOverflow.ellipsis,
                          style: FontStyle.productsansBold(
                              FontStyle.secondaryColor.withOpacity(0.8), 14),
                        ),
                      ),
                      Text(
                        index % 2 == 0 ? "Booked" : "Queue",
                        style: FontStyle.productsansBold(
                            FontStyle.secondaryColor, 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toggleSwitch(bool value, Function fun) {
    return Container(
      padding: EdgeInsets.only(right: 8.0.w),
      child: Row(
        children: <Widget>[
          Switch(
            value: value,
            activeColor: Colors.green,
            onChanged: (value) {
              setState(() {
                fun();
              });
            },
          ),
          Text(
            value ? "Online" : "Offline",
            style: FontStyle.productsansBold(
                value ? Colors.green : Colors.white54, 14),
          ),
        ],
      ),
    );
  }
}
