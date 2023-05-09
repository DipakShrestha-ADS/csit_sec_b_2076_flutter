import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  var obscure = true.obs;
  final formKey = GlobalKey<FormState>();
  Uint8List? data;
// final imagePicker = ImagePicker();

  String? confirmPasswordValidator(value) {
    if (value == null || value.isEmpty == true) {
      return 'Please enter your password.';
    }

    if ((value.length ?? 0 < 8) == true) {
      return 'Please enter a valid password.';
    }
    if (value != passwordController.text) {
      return 'Password doesn\'t matched!';
    }
    return null;
  }

  String? ageValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age.';
    }

    final age = int.tryParse(value);
    if (age == null) {
      return 'Enter your valid number.';
    }
    if (age < 18) {
      return 'Enter age above 18.';
    }
    return null;
  }

  String? phoneValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number.';
    }
    if (value.length < 10) {
      return 'Please enter your valid phone number.';
    }
    return null;
  }
}
