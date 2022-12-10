import 'package:flutter/material.dart';

class IcModel with ChangeNotifier {
  bool colorIcon = false;


  void colorIconBlanco() {
    colorIcon = true;
    notifyListeners();
  }

  void colorIconNegro() {
    colorIcon = false;
    notifyListeners();
  }
}
