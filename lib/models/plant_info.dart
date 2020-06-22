import 'dart:ui';

class Plant{
  int id;
  String memo;
  String name;
  String startDate;
  String imagePath;
  List<WateringCycle> wateringCycleList;
}

class WateringCycle{
  int id;
  int plantId;
  String reminderTitle;
  int reminderCycleDays;
  Color color;
}