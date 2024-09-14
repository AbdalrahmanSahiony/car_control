import 'package:car/controller/home_controller.dart';
import 'package:car/core/constant/colors.dart';
import 'package:car/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ToyotaText extends StatelessWidget {
  const ToyotaText({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (HomeController controller) => Visibility(
        visible: !controller.isHideText,
        child: Text(
          "TOYOTA",
          style: TextStyle(
              color: AppColor.red,
              fontSize: SizeConfig.defaultSize! * 7,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
