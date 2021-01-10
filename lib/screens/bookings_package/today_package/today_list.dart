import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saloon_plus_barber/ThemeData/fontstyle.dart';

class TodayList extends StatefulWidget {
  @override
  _TodayListState createState() => _TodayListState();
}

class _TodayListState extends State<TodayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}
