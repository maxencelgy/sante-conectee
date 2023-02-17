import 'package:flutter/foundation.dart';

class MyState extends ChangeNotifier {
  String token = '';

  void updateMyVariable(String value) {
    token = value;
    notifyListeners();
  }
}
