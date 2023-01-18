import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CustomException {
  static errorMessage(DioError err) {
    if (err.response!.statusCode == 401) {
      Get.snackbar(
          "Unauthorized access", "You are not authorized for this request.");
    } else if (err.response!.statusCode == 500) {
      Get.snackbar("Internal server error", "Server error occoured.");
    } else {
      Get.snackbar("Unexpected error", "${err.response}");
    }
  }

  static noInternetConnecion() {
    return Get.snackbar("No Internet", "Please check your internet connection");
  }
}
