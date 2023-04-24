import 'package:first_project/get/counter_get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetScreen extends StatelessWidget {
  GetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CounterGet cg = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen'),
      ),
      body: Center(
        child: Obx(() {
          return Text(
            '${cg.count}',
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          cg.increment();
        },
        icon: const Icon(
          Icons.update,
        ),
        label: const Text(
          'Update Value',
        ),
      ),
    );
  }
}
