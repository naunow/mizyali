import 'dart:ui';

class ViewPlant{
  int id;
  String memo;
  String name;
  String startDate;
  String imagePath;
  List<ViewPlantCycle> wateringCycleList;
}

class ViewPlantCycle{
  int id;
  int plantId;
  String reminderTitle;
  int reminderCycleDays;
  Color color;
}