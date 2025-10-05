import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/level_description.dart';
import 'package:flutter/material.dart';

class LevelsListView extends StatelessWidget {
  const LevelsListView({
    super.key,
    required this.modelsList,
    required this.deleteLevel,
    required this.editLevel,
  });
  final List<LevelModel> modelsList;
  final void Function(LevelModel) deleteLevel;
  final void Function(LevelModel) editLevel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => LevelDescription(
        model: modelsList[index],
        deleteLevel: deleteLevel,
        editLevel: editLevel,
      ),
      itemCount: modelsList.length,
    );
  }
}
