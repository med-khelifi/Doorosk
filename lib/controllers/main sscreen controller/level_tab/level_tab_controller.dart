import 'dart:async';

import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:doorosk/database/education_stage_operation.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/add_new_level_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LevelTabController {
  late BuildContext _context;
  late final StreamController<String?> _selectedImageStreamController;
  late final Stream<String?> _selectedImageStream;
  String? _selectedImagePath;
  //get selectedImageStream => _selectedImageStream;
  late final Sink<String?> _selectedImageSink;
  LevelTabController(BuildContext context) {
    _context = context;
    _selectedImageStreamController = StreamController();
    _selectedImageStream = _selectedImageStreamController.stream
        .asBroadcastStream();
    _selectedImageSink = _selectedImageStreamController.sink;
  }
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _levelDescriptionTextController =
      TextEditingController();
  final TextEditingController _levelNameTextController =
      TextEditingController();

  Future<List<LevelModel>> getAllLevels() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    var rawList = await educationStageOperation.getAllLevels();
    List<LevelModel> res = rawList
        .map((map) => LevelModel.fromJson(map))
        .toList();
    return res;
  }

  void onAddLevelPressed(BuildContext context) {
    AddNewLevelBottomSheet.showAddNewLevelBottomSheet(
      context: context,
      onAddLevelPressed: addEducationButtonPressed,
      onPicPressed: () {},
      levelNameTextController: _levelNameTextController,
      levelDescriptionTextController: _levelDescriptionTextController,
      formKey: _formKey,
      levelNameFieldValidator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.pleaseEnterLevelName;
        }
        return null;
      },
      levelDescriptionFieldValidator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.pleaseEnterLevelName;
        }
        return null;
      },
      onSetImageTapped: onSetImagePressed,
      onDeletePicTapped: onDeleteLevelPicTapped,
      selectedPicStream: _selectedImageStream,
    );
  }

  void onSetImagePressed() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      _selectedImagePath = image.path;
      _selectedImageSink.add(image.path);
    } else {
      _selectedImagePath = null;
      _selectedImageSink.add(null);
    }
  }

  void onDeleteLevelPicTapped() {
    _selectedImagePath = null;
    _selectedImageSink.add(null);
  }

  void addEducationButtonPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    EducationStageOperation educationStageOperation = EducationStageOperation();
    String name = _levelNameTextController.text.trim();
    String desc = _levelNameTextController.text.trim();
    bool res = await educationStageOperation.insertLevelDetails(
      LevelModel(title: name, description: desc, imagePath: _selectedImagePath),
    );

    if (res) {
      // 1. Close the keyboard
      FocusScope.of(_context).unfocus();

      // 2. Show a dialog message
      showDialog(
        context: _context,
        builder: (ctx) => AlertDialog(
          title: Text(StringsManager.addingWithSuccessTitle),
          content: Text(StringsManager.addingDoneMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(); // close dialog
                Navigator.of(_context).pop(); // close bottom sheet
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}
