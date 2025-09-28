import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:flutter/widgets.dart';

class HomeScreenController {
  HomeScreenController(BuildContext context) {
    _context = context;
  }
  late BuildContext _context;
  void onGridItemTap(int index) {

    if (index == 0) {
      index = 4;
    } else if (index == 4)
      
      // ignore: curly_braces_in_flow_control_structures
      index = 0;

    Navigator.pushNamed(_context, RoutesNames.main, arguments: index);
  }
}
