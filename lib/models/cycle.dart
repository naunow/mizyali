class Cycle {
  int id;
  int plantId;
  String reminderTitle;
  int reminderCycleDays;
  String color;

  Cycle();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'plantId': plantId,
      'reminderTitle': reminderTitle,
      'reminderCycleDays': reminderCycleDays,
      'color': color,
    };
    return map;
  }

  Cycle.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    plantId = map['plantId'];
    reminderTitle = map['reminderTitle'];
    reminderCycleDays = map['reminderCycleDays'];
    color = map['color'];
  }
}
