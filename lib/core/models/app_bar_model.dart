import 'package:doorosk/core/models/app_bar_items_model.dart';
import 'package:flutter/widgets.dart';

class AppBarModel {
  final AppBarItemsModel appBarItem;
  final Widget body;

  AppBarModel({required this.appBarItem, required this.body});
}