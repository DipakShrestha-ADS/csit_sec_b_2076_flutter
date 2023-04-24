import 'dart:math' as math;

import 'package:first_project/get/counter_get.dart';
import 'package:first_project/get/http_get_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterGet cg = Get.put(CounterGet());
  @override
  Widget build(BuildContext ctx) {
    return GetMaterialApp(
      home: HttpGetScreen(),
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
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(
                seconds: 3,
              ),
              top: 300,
              // bottom: ,
              left: 200,
              // right: ,
              child: Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
            ),
          ],
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
