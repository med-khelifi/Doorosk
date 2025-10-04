
import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/levels_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchEducationLevel extends SearchDelegate<String> {
  SearchEducationLevel({required this.searchedListFuture});
  final Future<List<LevelModel>> Function(String) searchedListFuture;
  
  /// Theme
  @override
  ThemeData appBarTheme(BuildContext context) {
    final baseTheme = Theme.of(context);

    return baseTheme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.primaryColor,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: ColorsManager.whiteColor,
          fontFamily: FontsNamesManager.geDinarOneFontName,
          fontSize: 20.sp,
        ),
        border: InputBorder.none,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: ColorsManager.whiteColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Padding(
      padding: const EdgeInsets.only(right: 15),
      child: IconButton(onPressed: () {
        query ="";
      }, icon: Icon(Icons.close, color: ColorsManager.whiteColor)),
    )];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: ColorsManager.whiteColor),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return Container(
        color: ColorsManager.lightBlackColor,
        child: Center(
          child: Text(
            "من فضلك أدخل كلمة للبحث",
            style: TextStyle(
              color: ColorsManager.whiteColor,
              fontFamily: FontsNamesManager.geDinarOneFontName,
              fontSize: 15.sp,
            ),
          ),
        ),
      );
    }

    return ColoredBox(
      color: ColorsManager.lightBlackColor,
      child: FutureBuilder<List<LevelModel>>(
        future: searchedListFuture(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("حدث خطأ أثناء جلب البيانات"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("لم يتم العثور على نتائج"));
          } else {
            return LevelsListView(modelsList: snapshot.data!);
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) {
      return Container(
        color: ColorsManager.lightBlackColor,
        child: Center(
          child: Text(
            "اكتب اسم المستوى للبحث",
            style: TextStyle(
              color: ColorsManager.whiteColor,
              fontFamily: FontsNamesManager.geDinarOneFontName,
              fontSize: 15.sp,
            ),
          ),
        ),
      );
    }

    return ColoredBox(
      color: ColorsManager.lightBlackColor,
      child: FutureBuilder<List<LevelModel>>(
        future: searchedListFuture(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("حدث خطأ أثناء جلب البيانات"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("لا توجد اقتراحات"));
          } else {
            return LevelsListView(modelsList: snapshot.data!);
          }
        },
      ),
    );
  }
}
