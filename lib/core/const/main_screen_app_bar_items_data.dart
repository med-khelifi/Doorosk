import 'package:doorosk/core/models/app_bar_items_model.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';

class MainScreenAppBarItemsData {
  static List<AppBarItemsModel> appBarItems = [
    AppBarItemsModel(
      activeImagePath: ImagesManager.mainScreenBottomBarPayment1,
      inactiveImagePath: ImagesManager.mainScreenBottomBarPayment0,
      label: StringsManager.homeScreenPayment,
    ),
    AppBarItemsModel(
      activeImagePath: ImagesManager.mainScreenBottomBarAttendance1,
      inactiveImagePath: ImagesManager.mainScreenBottomBarAttendance0,
      label: StringsManager.homeScreenAttendance,
    ),
    AppBarItemsModel(
      activeImagePath: ImagesManager.mainScreenBottomBarStudent1,
      inactiveImagePath: ImagesManager.mainScreenBottomBarStudent0,
      label: StringsManager.homeScreenStudents,
    ),
    AppBarItemsModel(
      activeImagePath: ImagesManager.mainScreenBottomBarGroups1,
      inactiveImagePath: ImagesManager.mainScreenBottomBarGroups0,
      label: StringsManager.homeScreenGroups,
    ),
    AppBarItemsModel(
      activeImagePath: ImagesManager.mainScreenBottomBarLevels1,
      inactiveImagePath: ImagesManager.mainScreenBottomBarLevels0,
      label: StringsManager.homeScreenLearningLevels,
    ),
  ];
}
