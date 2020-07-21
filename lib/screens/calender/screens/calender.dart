import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList, WeekdayFormat;
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/view_models/calender_event_detail.dart';
import 'package:mizyaliapp/view_models/done_cycle.dart';
import 'package:mizyaliapp/screens/calender/widgets/calender_event.dart';
import 'package:mizyaliapp/screens/calender/widgets/monthly_calender.dart';

class Calender extends StatefulWidget {

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MonthlyCalender(func: setState),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 26),
              itemCount: 2,
              // the ListView only occupies the space it needs (it will still scroll when there more items).
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, int index) {
                return CalenderEvent();
              }),
        ],
      ),
    );
  }
}

class EventDetailSampleData {
  withSampleData() {
    var eventList = [
      CalenderEventDetail(name: 'Atom',
          date: DateTime(2020, 1, 1),
          path: 'assets/images/squareplant.jpg',
          doneCycle: [
            DoneCycle(name: 'Watering', color: AppColors.blue),
          ]),
    ];
  }
}