import 'package:mizyaliapp/screens/calender/screens/calender.dart';

import 'done_cycle.dart';

class CalenderEventDetail extends EventDetailSampleData{
  final String name;
  final String path;
  final DateTime date;
  final List<DoneCycle> doneCycle;

  CalenderEventDetail({this.path, this.name, this.date, this.doneCycle});


  factory CalenderEventDetail.withSampleData1(){
    return CalenderEventDetail(
        name: 'Atom',
        path: 'assets/images/cactus.jpg',
        date: DateTime(2020, 1, 1),
        doneCycle: DoneCycle.withSampleData1());
  }

  factory CalenderEventDetail.withSampleData2(){
    return CalenderEventDetail(
        name: 'Takiyon',
        path: 'assets/images/squareplant.jpg',
        date: DateTime(2019, 2, 14),
        doneCycle: DoneCycle.withSampleData2()
    );
  }
}
