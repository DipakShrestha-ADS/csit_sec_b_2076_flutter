import 'package:get/state_manager.dart';

class CounterGet extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var count = 0.obs;

  void increment() {
    count++;
  }

  void decrement() {
    count++;
  }
}
