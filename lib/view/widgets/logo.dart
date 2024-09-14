import 'package:car/controller/home_controller.dart';
import 'package:car/core/constant/image.dart';
import 'package:car/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Center(
        child: GestureDetector(
            onTap: () {
              controller.logoRotate();
            },
            child: AnimatedRotation(
              duration: const Duration(seconds: 3),
              turns: controller.turn,
              child: Image.asset(
                Img.tyota,
                height: SizeConfig.defaultSize! * 20,
              ),
            )),
      ),
    );
  }
}
