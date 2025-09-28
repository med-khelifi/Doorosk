import 'package:doorosk/controllers/main%20sscreen%20controller/main_screen_controller.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/views/main/widgets/custom_bottom_navigation_bar_main_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenController _controller;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int index = ModalRoute.of(context)!.settings.arguments as int;
    _controller = MainScreenController(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<(int selectedIndex, Widget body)>(
      stream: _controller.appBarTabsStream,
      builder: (context, data) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBarMainScreen(
            selectedIndex: !data.hasData ? 0 : data.data!.$1,
            appBarModels: _controller.appBarItems,
            onItemTap: _controller.onAppBarItemTap,
          ),
          backgroundColor: ColorsManager.blackColor,
          body: SafeArea(child: !data.hasData ? Container() : data.data!.$2),
        );
      },
    );
  }
}
