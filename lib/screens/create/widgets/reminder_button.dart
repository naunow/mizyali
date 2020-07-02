import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';

class ReminderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: FlatButton.icon(onPressed: () {},
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
