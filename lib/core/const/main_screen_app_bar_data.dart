import 'package:doorosk/core/const/main_screen_app_bar_items_data.dart';
import 'package:doorosk/core/models/app_bar_model.dart';
import 'package:doorosk/views/main/appBarTabs/attendance/attendance_tab.dart';
import 'package:doorosk/views/main/appBarTabs/groups/groups_tab.dart';
import 'package:doorosk/views/main/appBarTabs/levels/levels_tab.dart';
import 'package:doorosk/views/main/appBarTabs/payment/payment_tab.dart';
import 'package:doorosk/views/main/appBarTabs/students/students_tab.dart';

class MainScreenAppBarData {
  static List<AppBarModel> appBarItems = [
    AppBarModel(
      appBarItem: MainScreenAppBarItemsData.appBarItems[0],
      body: PaymentTap(),
    ),
    AppBarModel(
      appBarItem: MainScreenAppBarItemsData.appBarItems[1],
      body: AttendanceTab(),
    ),
    AppBarModel(
      appBarItem: MainScreenAppBarItemsData.appBarItems[2],
      body: StudentsTab(),
    ),
    AppBarModel(
      appBarItem: MainScreenAppBarItemsData.appBarItems[3],
      body: GroupsTab(),
    ),
    AppBarModel(
      appBarItem: MainScreenAppBarItemsData.appBarItems[4],
      body: LevelsTab(),
    ),
  ];
}
