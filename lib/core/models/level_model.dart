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
  factory LevelModel.fromJson(Map<String, Object?> map) {
    return LevelModel(
      levelId: map['id']?.toString(),
      title: map['name']?.toString() ?? '',
      description: map['desc']?.toString() ?? '',
      imagePath: map['image']?.toString(),
    );
  }
}
