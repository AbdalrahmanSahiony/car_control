import 'package:car/core/constant/colors.dart';
import 'package:car/core/size_config.dart';
import 'package:flutter/material.dart';

class CusstomIconButton extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;
  const CusstomIconButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.defaultSize! * 8,
        width: SizeConfig.defaultSize! * 8,
        decoration: BoxDecoration(
          color: AppColor.red,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 8),
        ),
        child: IconButton(onPressed: onPressed, icon: icon));
  }
}
