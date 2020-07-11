import 'package:flutter/material.dart';
import 'package:mizyaliapp/configs/AppColors.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.pop(context);
        }, color: AppColors.black,),
      ),
    );
  }
}
