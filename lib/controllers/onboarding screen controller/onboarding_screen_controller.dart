import 'dart:async';
import 'package:doorosk/core/const/onboarding_screen_data.dart';
import 'package:doorosk/core/models/page_view_model.dart';
import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:flutter/material.dart';

class OnboardingScreenController {
  late BuildContext _context;
  late int _currPageViewIndex;
  late PageController pageController;

  late StreamController<double> _dotsPositionStreamController;
  late Sink<double> _dotsPositionSink;
  late Stream<double> _dotsPositionStream;
  Stream<double> get dotsPositionStream => _dotsPositionStream;

  late StreamController<bool> _nextStartStreamController;
  late Sink<bool> _nextStartSink;
  late Stream<bool> _nextStartStream;
  Stream<bool> get nextStartStream => _nextStartStream;

  OnboardingScreenController(BuildContext context) {
    _context = context;
    _currPageViewIndex = 0;
    pageController = PageController();
    _dotsPositionStreamController = StreamController();
    _dotsPositionSink = _dotsPositionStreamController.sink;
    _dotsPositionStream = _dotsPositionStreamController.stream
        .asBroadcastStream();
    _dotsPositionSink.add(0);

    _nextStartStreamController = StreamController();
    _nextStartSink = _nextStartStreamController.sink;
    _nextStartStream = _nextStartStreamController.stream.asBroadcastStream();
    _nextStartSink.add(false);
  }

  int getPageViewItemsCount() {
    return OnboardingScreenData.pageViewData.length;
  }

  PagerViewModel getModelOf(int index) {
    return OnboardingScreenData.pageViewData[index];
  }

  void onNextButtonPressed() {
    _currPageViewIndex++;
    if (_currPageViewIndex >= getPageViewItemsCount()) {
      return _goTpHomeScreen();
    }
    pageController.animateToPage(
      _currPageViewIndex,
      duration: Duration(microseconds: 600),
      curve: Curves.ease,
    );
    _dotsPositionSink.add(_currPageViewIndex.toDouble());
  }

  void onPageViewPageChanged(int index) {
    _currPageViewIndex = index;
    _nextStartSink.add(_currPageViewIndex == getPageViewItemsCount() - 1);
    _dotsPositionSink.add(_currPageViewIndex.toDouble());
  }

  void _goTpHomeScreen() {
    Navigator.pushReplacementNamed(_context, RoutesNames.home);
  }

  void onSkipButtonPressed() {
    _goTpHomeScreen();
  }
}
