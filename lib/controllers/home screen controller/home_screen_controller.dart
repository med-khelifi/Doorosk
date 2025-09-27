import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:flutter/widgets.dart';

class HomeScreenController {
  HomeScreenController(BuildContext context) {
    _context = context;

  }
  late BuildContext _context;
  void onGridItemTap(int index) {
    Navigator.pushNamed(_context, RoutesNames.main);
  }
}