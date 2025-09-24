import 'package:doorosk/core/models/page_view_model.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';

class OnboardingScreenData {
  static const List<PagerViewModel> pageViewData = [
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg1,
      title: StringsManager.pagerViewTitle1,
    ),
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg2,
      title: StringsManager.pagerViewTitle2,
    ),
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg3,
      title: StringsManager.pagerViewTitle3,
    ),
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg4,
      title: StringsManager.pagerViewTitle4,
    ),
    PagerViewModel(
      imagePath: ImagesManager.pagerViewImg5,
      title: StringsManager.pagerViewTitle5,
    ),
  ];
}
