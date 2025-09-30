import 'package:doorosk/core/models/level_model.dart';

class  LevelTabController {
  LevelTabController(){}
  List<LevelModel> levelsList = [
    LevelModel(
      levelId: "1",
      title: "Beginner",
      description: "This level is for beginners to get started.",
      imagePath: "assets/images/beginner.png",
    ),
    LevelModel(
      levelId: "2",
      title: "Intermediate",
      description: "This level is for those with some experience.",
      imagePath: "assets/images/intermediate.png",
    ),
    LevelModel(
      levelId: "3",
      title: "Advanced",
      description: "This level is for advanced learners.",
      imagePath: "assets/images/advanced.png",
    ),
  ];
}