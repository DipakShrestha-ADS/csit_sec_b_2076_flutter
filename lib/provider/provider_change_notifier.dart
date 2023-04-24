import 'package:flutter/cupertino.dart';

class ProviderChangeNotifier extends ChangeNotifier {
  String value = "Everyone";

  void changeValue() {
    value = "Only One dkjfdkf";
    notifyListeners();
  }
}
