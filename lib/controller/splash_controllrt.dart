import 'package:car/view/pages/home.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void gotoHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => const Home());
    });
  }

  @override
  void onInit() {
    gotoHome();
    super.onInit();
  }
}
