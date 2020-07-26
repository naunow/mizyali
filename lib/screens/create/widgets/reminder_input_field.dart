import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/localized.dart';
import 'package:mizyaliapp/models/cycle.dart';

class ReminderInputField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextInputType inputType;
  final Cycle cycle;
  final Function addCycleFunc;

  const ReminderInputField(
      {Key key,
      this.hintText,
      this.inputType,
      this.labelText,
      this.cycle,
      this.addCycleFunc})
      : super(key: key);

  @override
  _ReminderInputFieldState createState() => _ReminderInputFieldState();
}

class _ReminderInputFieldState extends State<ReminderInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        obscureText: false,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintText: this.widget.hintText,
          labelText: this.widget.labelText,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (value) => null,
        onSaved: (String value) {
          this.widget.hintText == Localized.of(context).reminderHintText
              ? this.widget.cycle.reminderTitle = value
              : this.widget.cycle.reminderCycleDays = int.parse(value);
          debugPrint(value);
          this.widget.addCycleFunc != null ? this.widget.addCycleFunc() : null;
        });
  }
}
