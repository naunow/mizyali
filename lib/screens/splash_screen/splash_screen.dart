import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mizyaliapp/configs/AppColors.dart';
import 'package:mizyaliapp/configs/AppShadows.dart';
import 'package:mizyaliapp/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), ()=> HomePath());
  }
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex:1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/plant.svg', width: 150, height: 150, color: Colors.black87,),
                        Text('MizYali', style: TextStyle(color: AppColors.black, fontSize: 20, shadows: AppShadows.font_shadow),),
                      ],
                    ),
                  ),
                ),
              ],),
          )
        ],
      ),
    );
  }
}
