import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, EventList, WeekdayFormat;
import 'package:mizyaliapp/screens/calender/screens/calender.dart';
import 'calender_chosen_date.dart' as globals;

class MonthlyCalender extends StatefulWidget {
  final func;

  const MonthlyCalender({Key key, this.func}) : super(key: key);
  @override
  _MonthlyCalenderState createState() => _MonthlyCalenderState();
}

class _MonthlyCalenderState extends State<MonthlyCalender> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 380,
      child: calender(),
    );
  }

  Widget calender() {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.topCenter,
      child: CalendarCarousel<Event>(
        onDayPressed: (DateTime selectedDate, List<Event> events) {
          widget.func(() {
            globals.chosenDate = selectedDate;
          });
        },
        selectedDateTime: globals.chosenDate,
        daysHaveCircularBorder: false,
        weekDayFormat: WeekdayFormat.short,

        /// null for not rendering any border, true for circular border, false for rectangular border
        markedDatesMap: _getSampleEvents(),
        todayButtonColor: AppColors.grey,
        todayBorderColor: AppColors.dark_shadow,
        todayTextStyle: TextStyle(color: AppColors.black),
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


}
