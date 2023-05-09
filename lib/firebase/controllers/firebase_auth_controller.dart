import 'package:first_project/firebase/controllers/register_controller.dart';
import 'package:first_project/firebase/screens/login_page.dart';
import 'package:first_project/firebase/screens/register_page.dart';
import 'package:first_project/firebase/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseAuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscure = true.obs;
  final formKey = GlobalKey<FormState>();
  final fas = FirebaseAuthService();
  final rc = Get.find<RegisterController>();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    }

    if (!value.contains('@') || !value.contains('.')) {
      return 'Enter a valid Email';
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value == null || value.isEmpty == true) {
      return 'Please enter your password.';
    }

    if ((value.length ?? 0 < 8) == true) {
      return 'Please enter a valid password.';
    }
    return null;
  }

  Future<void> onPressedLogin() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      await fas.login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  void onPressedRegister() async {
    rc.formKey.currentState!.save();
    if (rc.formKey.currentState!.validate()) {
      final fullName = rc.fullNameController.text;
      final email = rc.emailController.text;
      final password = rc.passwordController.text;
      final age = rc.ageController.text;
      final phoneNumber = rc.phoneController.text;
      await fas.createUser(
        email: email,
        password: password,
      );
    }
  }

  void goToLogin() {
    Get.to(() {
      return LoginPage();
    });
  }

  void goToRegister() {
    Get.to(() {
      return RegisterPage();
    });
  }

  void onPressedGoogleSignIn() {}
}
