import 'dart:async';

import 'package:conduit/features/auth/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      authorize();
    });
    super.onInit();
  }

  authorize() async {
    var isLoggedIn = await Get.find<AuthController>().isAuthenticated();

    if (isLoggedIn == true) {
      // Get.toNamed("/navigation");
      Get.offAllNamed('/navigation');
    } else {
      Get.offAllNamed("/login");
    }
  }
}
