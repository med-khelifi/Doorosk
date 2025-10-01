class LevelModel {
  final String? levelId;
  final String title;
  final String description;
  final String? imagePath;

  LevelModel({
    this.levelId,
    required this.title,
    required this.description,
    this.imagePath,
  });
  Map<String, Object?> toMap() {
    return {"name": title, "desc": description, "image": imagePath};
    /*
  static const String educationalStageID = 'id';
  static const String educationalStageName = 'name';
  static const String educationalStageDesc = 'desc';
  static const String educationalStageImage = 'image';
  static const String educationalStageCreatedAt = 'created_at';
  static const String educationalStageStatus = 'status';
  */
  }
  // factory ItemStageModel.fromJson(Map<String,Object?> map){

  // }
}
