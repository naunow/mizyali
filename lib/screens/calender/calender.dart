import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList;
import 'package:mizyaliapp/configs/AppColors.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: calender(DateTime.now()),
    );
  }

  Widget calender(DateTime _currentDate) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.topCenter,
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime date, List<Event> events){
          this.setState(() => _currentDate = date);
        },
        //thisMonthDayBorderColor: Colors.grey,
        height: 500.0,
        selectedDateTime: _currentDate,
        daysHaveCircularBorder: false,

        /// null for not rendering any border, true for circular border, false for rectangular border
        markedDatesMap: _getSampleEvents(),
        selectedDayButtonColor: AppColors.dark_shadow,
        selectedDayBorderColor: AppColors.dark_shadow,
        daysTextStyle: textTheme.headline1,
        weekendTextStyle: textTheme.headline1,
        selectedDayTextStyle: textTheme.headline1.apply(color: AppColors.grey),
        headerTextStyle: textTheme.headline3,
        weekdayTextStyle: textTheme.headline3,
      ),
    );
  }
}

 _getSampleEvents(){
   var events = EventList<Event>(
       events: {
         DateTime(2020, 6, 16): [
           Event(date: DateTime(2020, 6, 16), title: 'New Plant'),
           Event(date: DateTime(2020, 6, 16), title: 'New Plant2'),
         ],
         DateTime(2020, 6, 22): [
           Event(date: DateTime(2020, 6, 22), title: 'Watering'),
         ],
         DateTime(2020, 6, 20): [
           Event(date: DateTime(2020, 6, 20), title: 'Watering'),
         ],
         DateTime(2020, 6, 28): [
           Event(date: DateTime(2020, 6, 28), title: 'Watering'),
         ]
       }
   );
   return events;
}