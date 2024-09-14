import 'package:car/controller/home_controller.dart';
import 'package:car/core/constant/colors.dart';
import 'package:car/core/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:slidable_button/slidable_button.dart';

class CusstomSliderButton extends StatelessWidget {
  const CusstomSliderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.defaultSize!),
      child: GetBuilder<HomeController>(
        builder: (controller) => HorizontalSlidableButton(
          initialPosition: SlidableButtonPosition.start,
          width: MediaQuery.of(context).size.width / 3,
          height: SizeConfig.defaultSize! * 5.5,
          buttonWidth: SizeConfig.defaultSize! * 5,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
          color: AppColor.grey400,
          buttonColor: AppColor.red,
          isRestart: true,
          dismissible: false,
          label: !controller.isLock
              ? const Icon(
                  CupertinoIcons.lock_open_fill,
                  color: AppColor.black,
                )
              : const Icon(
                  CupertinoIcons.lock_fill,
                  color: AppColor.black,
                ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.defaultSize! * 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.isLock
                    ? const Icon(CupertinoIcons.lock_open_fill)
                    : const Icon(CupertinoIcons.lock_fill),
                controller.isLock
                    ? const Icon(CupertinoIcons.lock_open_fill)
                    : const Icon(CupertinoIcons.lock_fill)
              ],
            ),
          ),
          onChanged: (position) {
            controller.isLockChange();
          },
        ),
      ),
    );
  }
}
