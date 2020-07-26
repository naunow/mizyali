import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/configs/localized.dart';
import 'package:mizyaliapp/models/cycle.dart';
import 'package:mizyaliapp/models/plant.dart';
import 'package:mizyaliapp/screens/create/widgets/input_field.dart';
import 'package:mizyaliapp/screens/create/widgets/large_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mizyaliapp/screens/create/widgets/reminder_input_field.dart';
import 'dart:io';

import 'package:mizyaliapp/widgets/circle_clipper.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var _formKey = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();
  List<Reminder> reminderList = [];

  // For insert
  Plant plant = Plant();
  List<Cycle> cycleList = List<Cycle>();

  _CreateState() {
    reminderList.add(Reminder(
      removeReminder: removeReminder,
      cycleList: cycleList,
    ));
  }

  Future _getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
      plant.imagePath = image.path;
    });
  }

  void _addReminder() {
    List<Reminder> list = [];
    list.addAll(reminderList);

    list.add(Reminder(
      removeReminder: removeReminder,
      cycleList: cycleList,
    ));

    setState(() {
      reminderList = list;
    });
  }

  void removeReminder(GlobalKey index) {
    setState(() {
      reminderList.removeWhere((reminder) => reminder.index == index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: AppColors.black,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(vertical: 36.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: CircleClipper(),
                child: Container(
                  height: 150,
                  width: 150,
                  color: AppColors.light_shadow,
                  child: GestureDetector(
                    onTap: _getImage,
                    child:
                        _image == null ? Icon(Icons.add) : Image.file(_image),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InputField(
                hintText: Localized.of(context).name,
                model: plant,
              ),
              InputField(
                hintText: Localized.of(context).description,
                model: plant,
              ),
              Column(children: reminderList),
              _reminderButton(),
              SizedBox(
                height: 50,
              ),
              LargeButton(
                text: Localized.of(context).saveButton,
                color: AppColors.grey,
                formKey: _formKey,
                plant: plant,
                cycleList: cycleList,
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  _reminderButton() {
    return Container(
      height: 40,
      child: FlatButton.icon(
        onPressed: _addReminder,
        icon: Icon(
          Icons.add,
          color: AppColors.grey,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        label: Text(
          Localized.of(context).reminderButton,
          style: Theme.of(context)
              .textTheme
              .headline3
              .apply(color: AppColors.grey),
        ),
        color: AppColors.black,
      ),
    );
  }
}

class Reminder extends StatefulWidget {
  final GlobalKey index = GlobalKey();
  final Function removeReminder;
  final List<Cycle> cycleList;

  Reminder({Key key, this.removeReminder, this.cycleList}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  Cycle cycle = Cycle();

  addCycleList() {
    this.widget.cycleList.remove(cycle);
    this.widget.cycleList.add(cycle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SizedBox(
              child: ReminderInputField(
                hintText: Localized.of(context).reminderHintText,
                labelText: Localized.of(context).reminderLabelText,
                inputType: TextInputType.text,
                cycle: cycle,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: ReminderInputField(
                hintText: Localized.of(context).cycleHintText,
                labelText: Localized.of(context).cycleLabelText,
                inputType: TextInputType.number,
                cycle: cycle,
                addCycleFunc: addCycleList,
              ),
            ),
          ),
          // Delete Icon
          IconButton(
            onPressed: () {
              setState(() {
                widget.removeReminder(widget.index);
              });
            },
            icon: Icon(
              Icons.delete,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
