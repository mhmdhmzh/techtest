import 'dart:async';
import 'package:flutter/material.dart';

class HomePageController {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  final StreamController _inputController = StreamController();
  StreamSink get inputSink => _inputController.sink;

  final StreamController _outputController = StreamController();
  StreamSink get outputSink => _outputController.sink;

  Stream get output => _outputController.stream;

  homePageController() {
    _inputController.stream.listen((value) {
      if (value is int) {
        _currentIndex = value;
      }
      outputSink.add(_currentIndex);
    });
  }

  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}
