import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/configs/AppShadows.dart';
import 'package:mizyaliapp/view_models/calender_event_detail.dart';
import 'package:mizyaliapp/view_models/done_cycle.dart';
import 'package:mizyaliapp/screens/calender/widgets/calender_chosen_date.dart' as globals;
import 'clip_image_rounded.dart';

class CalenderEvent extends StatefulWidget {

  @override
  _CalenderEventState createState() => _CalenderEventState();
}

class _CalenderEventState extends State<CalenderEvent> {

  var sample1 = CalenderEventDetail.withSampleData1();
  var sample2 = CalenderEventDetail.withSampleData2();

  List<Widget> _listItem(List<DoneCycle> cycleList){

    List<Widget> list = [];
    cycleList.forEach((cycle) {
      list.add(_cycleRow(doneCycle: cycle));
    });

    return list;
  }

  Row _cycleRow({DoneCycle doneCycle}) {
    return Row(
      children: <Widget>[
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: doneCycle.color),),
        SizedBox(width: 8,),
        Text(doneCycle.name + globals.chosenDate.day.toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 21),
        decoration: BoxDecoration(
          color: AppColors.grey,
          boxShadow: AppShadows.pop_shadow,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipImageRounded(
                  width: 40,
                  height: 40,
                  path: 'assets/images/cactus.jpg',),
                Text('Atom', style: Theme
                    .of(context)
                    .textTheme
                    .bodyText2,),
              ],
            ),
            SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _listItem(sample1.doneCycle),
            ),
          ],
        ),
      ),
    );
  }
}