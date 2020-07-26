import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/localized.dart';
import 'package:mizyaliapp/models/plant.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final Plant model;

  const InputField({Key key, this.hintText, this.model}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    debugPrint('=======INPUT FIELD=======');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SizedBox(
        height: 90,
        child: TextFormField(
            autofocus: false,
            obscureText: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: this.widget.hintText,
              labelText: this.widget.hintText,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
            ),
            validator: (value) => value.isEmpty
                ? Localized.of(context)
                    .validationRequireMessage(this.widget.hintText)
                : null,
            onSaved: (String value) {
              this.widget.hintText == Localized.of(context).name
                  ? widget.model.name = value
                  : widget.model.memo = value;
              debugPrint(
                  '=======PRINT REQUIRED FIELD [${this.widget.hintText}]=======：$value');
            }),
      ),
    );
  }
}
