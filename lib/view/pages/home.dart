import 'package:car/controller/home_controller.dart';
import 'package:car/core/constant/image.dart';
import 'package:car/core/size_config.dart';
import 'package:car/view/widgets/iocn_button.dart';
import 'package:car/view/widgets/logo.dart';
import 'package:car/view/widgets/test.dart';
import 'package:car/view/widgets/toyota_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      bottomNavigationBar: const CusstomSliderButton(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * 3.5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                    controller.icon.length,
                    (index) => CusstomIconButton(
                        onPressed: controller.icon[index]["onTap"],
                        icon: controller.icon[index]["icon"]))
              ],
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 5,
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CusstomIconButton(
                      onPressed: () {}, icon: SvgPicture.asset(Img.left)),
                  SvgPicture.asset(
                    Img.thunder,
                    height: SizeConfig.defaultSize! * 8,
                  ),
                  CusstomIconButton(
                      onPressed: () {},
                      icon: Transform.rotate(
                        angle: 110,
                        child: SvgPicture.asset(Img.left),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize! * 8,
            ),
            const Logo(),
            const ToyotaText(),
            SizedBox(
              height: SizeConfig.defaultSize! * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
