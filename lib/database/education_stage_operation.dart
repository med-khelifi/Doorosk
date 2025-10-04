import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/database/my_sq_f_lite_databse.dart';

class EducationStageOperation extends MySqFLiteDatabase {
  Future<bool> insertLevelDetails(LevelModel level) {
    return insert(
      tableName: MySqFLiteDatabase.educationalStageTableName,
      values: level.toMap(),
    );
  }

  Future<bool> updateEducationLevel(LevelModel level) {
    return update(
      tableName: MySqFLiteDatabase.educationalStageTableName,
      values: level.toMapOnUpdate(),
      where: '${MySqFLiteDatabase.educationalStageID} == ?',
      whereArgs: [level.levelId],
    );
  }

  Future<List<Map<String, Object?>>> getAllLevels() async {
    return await select(
      tableName: MySqFLiteDatabase.educationalStageTableName,
      where: '${MySqFLiteDatabase.educationalStageStatus} == ?',
      whereArgs: [1],
    );
  }

  Future<List<Map<String, Object?>>> searchLevel({
    required String levelName,
  }) async {
    return await searchUsingLike(
      tableName: MySqFLiteDatabase.educationalStageTableName,
      searchWord: levelName,
      columnName: MySqFLiteDatabase.educationalStageName,
      whereQuery:
          '${MySqFLiteDatabase.educationalStageName} LIKE ? AND ${MySqFLiteDatabase.educationalStageStatus} == ?',
      whereArgs: ['%$levelName%', 1],
    );
  }

  Future<bool> softDelete({required LevelModel model}) async {
    return await update(
      tableName: MySqFLiteDatabase.educationalStageTableName,
      values: {MySqFLiteDatabase.educationalStageStatus: 0},
      where: '${MySqFLiteDatabase.educationalStageID} == ?',
      whereArgs: [model.levelId],
    );
  }
}
