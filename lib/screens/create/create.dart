import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/screens/create/widgets/input_field.dart';
import 'package:mizyaliapp/screens/create/widgets/input_reminder_field.dart';
import 'package:mizyaliapp/screens/create/widgets/large_button.dart';
import 'package:mizyaliapp/screens/create/widgets/reminder_button.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  var _formKey = GlobalKey<FormState>();

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
              Container(
                height: 150,
                width: 150,
                child: Placeholder(),
              ),
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