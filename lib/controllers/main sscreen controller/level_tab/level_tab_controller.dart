import 'dart:async';
import 'dart:io';
import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:doorosk/database/education_stage_operation.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/add_new_level_bottom_sheet.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/alert_dialog_camera_gallery.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/levels_list_view.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/search_education_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class LevelTabController {
  late BuildContext _context;

  /// Controllers
  final ImagePicker _imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _levelDescriptionTextController =
      TextEditingController();
  final TextEditingController _levelNameTextController =
      TextEditingController();

  /// Streams
  late StreamController<String?> _selectedImageStreamController;
  late Stream<String?> selectedImageStream;
  late Sink<String?> _selectedImageSink;

  /// Selected image path
  String? _selectedImagePath;

  LevelTabController(BuildContext context) {
    _context = context;
    _initStreamAndControllers();
  }

  /// Initialize Streams & Controllers
  void _initStreamAndControllers() {
    _selectedImageStreamController = StreamController<String?>();
    selectedImageStream = _selectedImageStreamController.stream
        .asBroadcastStream();
    _selectedImageSink = _selectedImageStreamController.sink;
  }

  /// Dispose (important to prevent memory leaks)
  void dispose() {
    _levelDescriptionTextController.dispose();
    _levelNameTextController.dispose();
    _selectedImageStreamController.close();
  }

  /// Get all levels from DB
  Future<List<LevelModel>> getAllLevels() async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    var rawList = await educationStageOperation.getAllLevels();
    return rawList.map((map) => LevelModel.fromJson(map)).toList();
  }

  Future<List<LevelModel>> searchLevelByName(String levelName) async {
    EducationStageOperation educationStageOperation = EducationStageOperation();
    var rawList = await educationStageOperation.searchLevel(
      levelName: levelName,
    );
    return rawList.map((map) => LevelModel.fromJson(map)).toList();
  }

  /// Show BottomSheet to add new level
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
          return StringsManager.pleaseEnterLevelDescription;
        }
        return null;
      },
      onSetImageTapped: onSetImagePressed,
      onDeletePicTapped: onDeleteLevelPicTapped,
      selectedPicStream: selectedImageStream,
    );
  }

  /// Pick image (camera/gallery)
  void onSetImagePressed() async {
    AlertDialogCameraGallery.showDialogChooseCameraOrGallery(
      context: _context,
      onCloseIconPressed: _closeDialog,
      onCameraIconPressed: () => _pickImage(ImageSource.camera),
      onGalleryIconPressed: () => _pickImage(ImageSource.gallery),
    );
  }

  void onDeleteLevelPicTapped() {
    _selectedImagePath = null;
    _selectedImageSink.add(null);
  }

  /// Add new level to DB
  void addEducationButtonPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    EducationStageOperation educationStageOperation = EducationStageOperation();
    String name = _levelNameTextController.text.trim();
    String desc = _levelDescriptionTextController.text.trim();
    bool res = await educationStageOperation.insertLevelDetails(
      LevelModel(title: name, description: desc, imagePath: _selectedImagePath),
    );

    if (res) {
      // Close the keyboard
      FocusScope.of(_context).unfocus();

      // Show success dialog
      showDialog(
        context: _context,
        builder: (ctx) => AlertDialog(
          title: Text(StringsManager.addingWithSuccessTitle),
          content: Text(StringsManager.addingDoneMessage),
          actions: [
            TextButton(onPressed: _onCloseBottomSheet, child: Text("OK")),
          ],
        ),
      );
    }
  }

  /// Copy image to safe directory
  Future<String> getImagePath(XFile image) async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String appDirPath = appDir.path;
    String finalPath = '$appDirPath/${image.name}';
    File myImage = await File(image.path).copy(finalPath);
    return myImage.path;
  }

  /// Close BottomSheet & clear form
  void _onCloseBottomSheet() {
    Navigator.of(_context).pop(); // close dialog
    Navigator.of(_context).pop(); // close bottom sheet
    _selectedImagePath = null;
    _levelNameTextController.clear();
    _levelDescriptionTextController.clear();
  }

  /// Handle image pick logic
  void _pickImage(ImageSource source) async {
    final XFile? image = await _imagePicker.pickImage(source: source);

    if (image != null) {
      _selectedImagePath = await getImagePath(image);
      _selectedImageSink.add(_selectedImagePath); // send copied path
    } else {
      _selectedImagePath = null;
      _selectedImageSink.add(null);
    }

    _closeDialog();
  }

  void _closeDialog() {
    Navigator.of(_context).pop();
  }

  /// Handle Search
  void onSearchTapped() {
    showSearch(
      context: _context,
      delegate: SearchEducationLevel(searchedListFuture: searchLevelByName),
    );
  }
}
