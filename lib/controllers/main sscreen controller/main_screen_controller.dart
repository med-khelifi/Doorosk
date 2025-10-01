import 'dart:async';


import 'package:doorosk/core/const/main_screen_app_bar_data.dart';
import 'package:doorosk/core/const/main_screen_app_bar_items_data.dart';
import 'package:doorosk/core/models/app_bar_items_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreenController {
  List<AppBarItemsModel> get appBarItems =>
      MainScreenAppBarItemsData.appBarItems;
  late Stream<(int, Widget)> _appBarTabsStream;
  late StreamController<(int, Widget)> _appBarTabsStreamController;
  late Sink<(int, Widget)> _appBarTabsSink;
  get appBarTabsStream => _appBarTabsStream;

  MainScreenController(BuildContext context,int initialTabIndex) {
    _appBarTabsStreamController = StreamController();
    _appBarTabsStream = _appBarTabsStreamController.stream.asBroadcastStream();
    _appBarTabsSink = _appBarTabsStreamController.sink;
    _appBarTabsSink.add((initialTabIndex, MainScreenAppBarData.appBarItems[initialTabIndex].body));
  }
  void onAppBarItemTap(int index) {
    _appBarTabsSink.add((index, MainScreenAppBarData.appBarItems[index].body));
  }

  void dispose() {
    _appBarTabsStreamController.close();
  }
 
}
