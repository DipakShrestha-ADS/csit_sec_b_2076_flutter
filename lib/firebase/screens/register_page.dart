import 'package:first_project/firebase/controllers/firebase_auth_controller.dart';
import 'package:first_project/firebase/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final rc = Get.find<RegisterController>();
    final fc = Get.find<FirebaseAuthController>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: rc.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    'https://www.projectcounter.org/wp-content/uploads/2016/03/icon-register.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Create your Account",
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
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Center(
                        child: Wrap(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.add_photo_alternate,
                                color: Colors.teal,
                              ),
                              onPressed: () async {
                                // final imageFile = await imagePicker.pickImage(
                                //   source: ImageSource.gallery,
                                // );
                                // BlocProvider.of<ImagePickerCubit>(context).handlePickedImage(imageFile);
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                // final imageFile = await imagePicker.pickImage(
                                //   source: ImageSource.camera,
                                // );
                                // BlocProvider.of<ImagePickerCubit>(context).handlePickedImage(imageFile);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.red,
                          size: 150,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: rc.fullNameController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: rc.emailController,
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
                padding: EdgeInsets.all(10),
                child: Obx(() {
                  return TextFormField(
                    controller: rc.passwordController,
                    validator: fc.passwordValidator,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: rc.obscure.value,
                    textInputAction: TextInputAction.next,
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
              Padding(
                padding: EdgeInsets.all(10),
                child: Obx(() {
                  return TextFormField(
                    validator: rc.confirmPasswordValidator,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: rc.obscure.value,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  //maxLength: 2,
                  controller: rc.ageController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  validator: rc.ageValidator,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: rc.phoneController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: rc.phoneValidator,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                return ElevatedButton(
                  onPressed: fc.registerLoading.value ? null : fc.onPressedRegister,
                  child: fc.registerLoading.value
                      ? Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          width: 50,
                          child: const CircularProgressIndicator(),
                        )
                      : const Text('Register'),
                );
              }),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
