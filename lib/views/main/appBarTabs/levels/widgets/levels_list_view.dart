import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/level_description.dart';
import 'package:flutter/material.dart';

class LevelsListView extends StatelessWidget {
  const LevelsListView({super.key, required this.modelsList});
  final List<LevelModel> modelsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          LevelDescription(model: modelsList[index]),
      itemCount: modelsList.length,
    );
  }
}
