import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:car/controller/splash_controllrt.dart';
import 'package:car/core/constant/colors.dart';
import 'package:car/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    SizeConfig().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "power by:",
            style: TextStyle(
                color: AppColor.red,
                fontSize: Get.height / 30,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Abdalrahman Sahiony",
            style: TextStyle(
                color: AppColor.red,
                fontSize: Get.height / 40,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              "TOYOTA",
              speed: const Duration(milliseconds: 180),
              textStyle: TextStyle(
                  color: AppColor.red,
                  fontSize: Get.height / 7.7,
                  fontWeight: FontWeight.bold),
            ),
          ],
          isRepeatingAnimation: true,
          repeatForever: true,
          stopPauseOnTap: false,
        ),
      ),
    );
  }
}
