import 'package:first_project/firebase/controllers/firebase_auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fc = Get.find<FirebaseAuthController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: fc.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "LogIn to your Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: fc.emailController,
                  validator: fc.emailValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(() {
                  return TextFormField(
                    controller: fc.passwordController,
                    validator: fc.passwordValidator,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: fc.obscure.value,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Obx(() {
                    return OutlinedButton(
                      onPressed: fc.loginLoading.value ? null : fc.onPressedLogin,
                      child: fc.loginLoading.value ? CupertinoActivityIndicator() : const Text('Login'),
                    );
                  }),
                  const SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: fc.goToRegister,
                    child: const Text('Register'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: fc.onPressedGoogleSignIn,
                child: const Text('Google SignIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
