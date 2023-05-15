import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Setting up...',
          ),
          const SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
