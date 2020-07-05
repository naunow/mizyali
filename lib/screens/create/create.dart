import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/screens/create/widgets/input_field.dart';
import 'package:mizyaliapp/screens/create/widgets/input_reminder_field.dart';
import 'package:mizyaliapp/screens/create/widgets/large_button.dart';
import 'package:mizyaliapp/screens/create/widgets/reminder_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:mizyaliapp/screens/home/widgets/plant_pic.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var _formKey = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();

  Future _getImage() async{
    var image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
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
              InputReminderField(
                hintText: 'Reminder title',
              ),
              ReminderButton(),
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
}