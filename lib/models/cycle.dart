class Cycle {
  int id;
  int plantId;
  String reminderTitle;
  int reminderCycleDays;
  String color;
  String lastDoneDay;

  Cycle();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'plantId': plantId,
      'reminderTitle': reminderTitle,
      'reminderCycleDays': reminderCycleDays,
      'color': color,
      'lastDoneDay': lastDoneDay,
    };
    return map;
  }

  Cycle.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    plantId = map['plantId'];
    reminderTitle = map['reminderTitle'];
    reminderCycleDays = map['reminderCycleDays'];
    color = map['color'];
    lastDoneDay = map['lastDoneDay'];
  }
}
