import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  late SharedPreferences spInstance;
  @override
  void onReady() {
    SharedPreferences.getInstance().then((value) {
      spInstance = value;
      final token = value.getString('p_token');
      bool expired = true;
      if (token != null) {
        expired = JwtDecoder.isExpired(token);
        debugPrint('expired : $expired');
      }
      Future.delayed(
        const Duration(
          seconds: 3,
        ),
      ).then((value) {
        if (expired) {
          Get.offAndToNamed('/login');
        } else {
          Get.offAndToNamed('/home');
        }
      });
    });
    super.onReady();
  }
}
