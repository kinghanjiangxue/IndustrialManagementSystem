// 左右标题
class TitleDataModel {
  // for ordering in the graph
  final int? id;
  final String? name;

  const TitleDataModel({
    this.name,
    this.id,
  });

  factory TitleDataModel.fromJson(Map<String, dynamic> json) {
    return TitleDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}