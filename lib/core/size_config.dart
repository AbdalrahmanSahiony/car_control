import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHight;
  static double? defaultSize;
  static Orientation? orientation;
  void init(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final mediaQueryData = MediaQuery.of(context);
      screenWidth = mediaQueryData.size.width;
      screenHight = mediaQueryData.size.height;
      orientation = mediaQueryData.orientation;
      defaultSize = orientation == Orientation.landscape
          ? screenHight! * 0.024
          : screenWidth! * 0.024;
      //  print("the default size is $defaultSize");
    });
  }
}
