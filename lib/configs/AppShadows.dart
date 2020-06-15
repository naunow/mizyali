import 'package:flutter/material.dart';
import 'AppColors.dart';

class AppShadows {
  static const List<Shadow> font_shadow = [
    Shadow(
      blurRadius: 4.0,
      offset: Offset(2, 2),
      color: AppColors.dark_shadow,
    ),
    Shadow(
      blurRadius: 4.0,
      offset: Offset(-2, -2),
      color: AppColors.light_shadow,
    ),
  ];

  static const List<BoxShadow> pop_shadow = [
    BoxShadow(
      blurRadius: 16.0,
      offset: Offset(9, 9),
      color: AppColors.dark_shadow,
    ),
    BoxShadow(
      blurRadius: 16.0,
      offset: Offset(-9, -9),
      color: AppColors.light_shadow,
    ),
  ];

  static const List<BoxShadow> push_shadow = [
    BoxShadow(
      color: AppColors.dark_shadow,
      offset: Offset(0, 0),
    ),
    BoxShadow(
      color: AppColors.light_shadow,
      offset: Offset(3, 3),
      spreadRadius: -1.0,
      blurRadius:3.0,
    ),
    BoxShadow(
      color: AppColors.grey,
      offset: Offset(0, 2),
      spreadRadius: 2,
      blurRadius: 10.0,
    ),
  ];
}
