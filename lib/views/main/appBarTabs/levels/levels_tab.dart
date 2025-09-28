import 'package:doorosk/views/main/appBarTabs/widgets/custom_tabes_app_bar.dart';
import 'package:flutter/material.dart';

class LevelsTab extends StatelessWidget {
  const LevelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabesAppBar(onAddTap: () {  }, onSearchTap: () {  }, label: 'dddddddd',)
      ],
    );
  }
}
