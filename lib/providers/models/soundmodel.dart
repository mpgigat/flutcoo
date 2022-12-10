import 'package:flutter/material.dart';

class SoundModel with ChangeNotifier {
  bool isVisibleMix = false;
  bool isVisiblePlay = true;
  bool isVisibleStop = false;

  void yesVisiblePlay() {
    isVisiblePlay = true;
    notifyListeners();
  }

  void notVisiblePlay() {
    isVisiblePlay = false;
    notifyListeners();
  }

  void yesVisibleStop() {
    isVisibleStop = true;
    notifyListeners();
  }

  void notVisibleStop() {
    isVisibleStop = false;
    notifyListeners();
  }

  void yesVisibleMix() {
    isVisibleMix = true;
    notifyListeners();
  }

  void notVisibleMix() {
    isVisibleMix = false;
    notifyListeners();
  }
}
