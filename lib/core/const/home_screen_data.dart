import 'package:doorosk/core/models/page_view_model.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';

class HomeScreenData{
  static const List<PagerViewModel> pageViewData = [
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg1,
      title: StringsManager.homeScreenLearningLevels,
    ),
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg2,
      title: StringsManager.homeScreenGroups,
    ),
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg3,
      title: StringsManager.homeScreenStudents,
    ),
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg4,
      title: StringsManager.homeScreenAttendance,
    ),
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg5,
      title: StringsManager.homeScreenPayment,
    ),
  ];
}