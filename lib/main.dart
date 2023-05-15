import 'dart:math' as math;

import 'package:firebase_core/firebase_core.dart';
import 'package:first_project/firebase/controllers/firebase_auth_controller.dart';
import 'package:first_project/firebase/controllers/splash_controller.dart';
import 'package:first_project/firebase/screens/login_page.dart';
import 'package:first_project/firebase/screens/register_page.dart';
import 'package:first_project/firebase_options.dart';
import 'package:first_project/get/counter_get.dart';
import 'package:first_project/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase/controllers/register_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterGet cg = Get.put(CounterGet());
  @override
  Widget build(BuildContext ctx) {
    Get.put(SplashController());
    Get.put(RegisterController());
    Get.put(FirebaseAuthController());
    return GetMaterialApp(
      routes: {
        '/': (ctx) {
          return SplashScreen();
        },
        '/home': (ctx) {
          return HomePage();
        },
        '/login': (ctx) {
          return LoginPage();
        },
        '/register': (ctx) {
          return RegisterPage();
        },
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String value = 'Hello';
  @override
  void initState() {
    print('init state called');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final random = math.Random();
  @override
  Widget build(BuildContext context) {
    print('build method called');
    final size = MediaQuery.of(context).size;
    final fac = Get.find<FirebaseAuthController>();
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: OutlinedButton(
            onPressed: fac.logout,
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    print('did updated widget called');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose called');
    super.dispose();
  }
}
