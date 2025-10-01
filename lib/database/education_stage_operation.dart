import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/database/my_sq_f_lite_databse.dart';

class EducationStageOperation extends MySqFLiteDatabase {
  Future<bool> insertLevelDetails(LevelModel level){
    return insert(tableName: MySqFLiteDatabase.educationalStageTableName, values: level.toMap());
  }
}
