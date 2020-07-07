import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/screens/create/widgets/input_field.dart';
import 'package:mizyaliapp/screens/create/widgets/large_button.dart';
import 'package:image_picker/image_picker.dart';
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

  _CreateState(){
    reminderList.add(Reminder(removeReminder: removeReminder,));
  }

  Future _getImage() async{
    var image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

  void _addReminder(){
    List<Reminder> list = [];
    list.addAll(reminderList);
    var index = reminderList.length;

    list.add(Reminder(removeReminder: removeReminder,));

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
                    child: _image == null ? Icon(Icons.add) : Image.file(_image),
                  ),
                ),
              ),
              SizedBox(height: 25),
              InputField(
                hintText: 'Name',
              ),
              InputField(
                hintText: 'Discription',
              ),
//              Column(children: reminderList),
              Column(children: reminderList),
              _reminderButton(),
              SizedBox(height: 50,),
              LargeButton(
                text: 'Save',
                color: AppColors.grey,
                formKey: _formKey,
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
        icon: Icon(Icons.add, color: AppColors.grey,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        label: Text('Add Reminder', style: Theme
            .of(context)
            .textTheme
            .headline3
            .apply(color: AppColors.grey),),
        color: AppColors.black,
      ),
    );
  }

}

class Reminder extends StatefulWidget {
  final GlobalKey index = GlobalKey();
  final Function removeReminder;

  Reminder({Key key, this.removeReminder}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SizedBox(
              child: TextFormField(
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Reminder ${widget.index.toString()}',
                    labelText: 'Reminder ${widget.index.toString()}',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (value) => null,
                  onSaved: (String value){},
//                onSaved: (String value) {
//                  _loginData.password = value;
//                }
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: TextFormField(
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'every 5 days',
                    labelText: 'Cycle',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border:
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  validator: (value) => null,
                  onSaved: (String value) {
                    print(value);
                  }
              ),
            ),
          ),
          IconButton(
            onPressed: (){
              setState(() {
                widget.removeReminder(widget.index);
              });
            },
            icon: Icon(Icons.delete,
              color: AppColors.black,),
          ),
        ],
      ),
    );
  }
}
