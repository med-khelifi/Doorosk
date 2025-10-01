import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:doorosk/database/education_stage_operation.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/add_new_level_bottom_sheet.dart';
import 'package:flutter/material.dart';

class LevelTabController {
  LevelTabController() {}
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _levelDescriptionTextController =
      TextEditingController();
  final TextEditingController _levelNameTextController =
      TextEditingController();
  List<LevelModel> levelsList = [
    LevelModel(
      levelId: "1",
      title: "Beginner",
      description: "This level is for beginners to get started.",
      imagePath: ImagesManager.test,
    ),
    LevelModel(
      levelId: "2",
      title: "Intermediate",
      description: "This level is for those with some experience.",
      imagePath: ImagesManager.test,
    ),
    LevelModel(
      levelId: "3",
      title: "Advanced",
      description: "This level is for advanced learners.",
      imagePath: ImagesManager.test,
    ),
  ];

  void onAddLevelPressed(BuildContext context) {
    AddNewLevelBottomSheet.showAddNewLevelBottomSheet(
      context: context,
      onAddLevelPressed: addEducationButtonPressed,
      onPicPressed: () {},
      levelNameTextController: _levelNameTextController,
      levelDescriptionTextController: _levelDescriptionTextController,
      formKey: _formKey,
    );
  }

  void addEducationButtonPressed() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    String name = _levelNameTextController.text.trim();
    String desc = _levelNameTextController.text.trim();
    bool res = await educationStageOperation.insertLevelDetails(
      LevelModel(title: name, description: desc),
    );

    print(res);
  }
}
