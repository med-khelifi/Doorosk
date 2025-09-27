import 'package:doorosk/controllers/home%20screen%20controller/home_screen_controller.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/views/home/widgets/custom_app_bar.dart';
import 'package:doorosk/views/home/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenController _controller;
  @override
  void initState() {
    super.initState();
    _controller = HomeScreenController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomGridView(onItemTap: _controller.onGridItemTap),
        ),
      ),
    );
  }
}
