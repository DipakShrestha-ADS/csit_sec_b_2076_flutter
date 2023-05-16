import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/firebase/controllers/register_controller.dart';
import 'package:first_project/firebase/controllers/splash_controller.dart';
import 'package:first_project/firebase/models/user_model.dart';
import 'package:first_project/firebase/services/firebase_auth_service.dart';
import 'package:first_project/firebase/services/firestore_services.dart';
import 'package:first_project/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseAuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscure = true.obs;
  final formKey = GlobalKey<FormState>();
  final fas = FirebaseAuthService();
  final rc = Get.find<RegisterController>();
  var registerLoading = false.obs;
  var loginLoading = false.obs;
  final sc = Get.find<SplashController>();
  final firestoreServices = FirestoreServices();

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
      loginLoading.value = true;
      try {
        final res = await fas.login(
          email: emailController.text,
          password: passwordController.text,
        );
        final token = await res.user!.getIdToken();
        print('token: $token');
        sc.spInstance.setString('p_token', token);
        Get.snackbar(
          'Login',
          'LoginSuccess',
        );
        Get.to(() {
          return HomePage();
        });
      } on FirebaseAuthException catch (e) {
        debugPrint('auth ex: ${e.message}');
        Get.snackbar(
          'Exception:',
          '${e.message}',
        );
      } catch (e) {
        debugPrint('auth ex: $e');
        Get.snackbar(
          'Exception:',
          '$e',
        );
      }
      loginLoading.value = false;
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
      registerLoading.value = true;
      try {
        await fas.createUser(
          email: email,
          password: password,
        );
        UserModel um = UserModel(
          email: email,
          fullName: fullName,
          age: int.parse(age),
          phoneNumber: int.tryParse(phoneNumber),
        );
        await firestoreServices.createUser(um);
        Get.snackbar(
          'Success',
          'Register Successfull.',
        );
        Get.back();
      } catch (e) {
        debugPrint('error auth: $e');
        Get.snackbar(
          'Error Message',
          'Something went wrong!',
        );
      }
      registerLoading.value = false;
    }
  }

  void goToLogin() {
    Get.toNamed('/login');
  }

  void goToRegister() {
    Get.toNamed('/register');
  }

  void logout() async {
    await sc.spInstance.remove('p_token');
    await fas.logout();
    Get.offAllNamed(
      '/login',
      predicate: (r) {
        final routeName = r.settings.name;
        return false;
      },
    );
  }

  void onPressedGoogleSignIn() {}
}
