import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/database/my_sq_f_lite_databse.dart';

class EducationStageOperation extends MySqFLiteDatabase {
  Future<bool> insertLevelDetails(LevelModel level) {
    return insert(
      tableName: MySqFLiteDatabase.educationalStageTableName,
      values: level.toMap(),
    );
  }

  Future<List<Map<String, Object?>>> getAllLevels() async {
    return await select(tableName: MySqFLiteDatabase.educationalStageTableName);
  }

  Future<List<Map<String, Object?>>> searchLevel({
    required String levelName,
  }) async {
    return await searchUsingLike(
      tableName: MySqFLiteDatabase.educationalStageTableName,
      searchWord: levelName,
      columnName: MySqFLiteDatabase.educationalStageName,
    );
  }
}
