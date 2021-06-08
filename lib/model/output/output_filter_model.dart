class OutputFilterModel {
  // for ordering in the graph
  final num? id;
  final String modelTitle;

  const OutputFilterModel({
    this.id,
    required this.modelTitle,
  });

  factory OutputFilterModel.fromJson(Map<String, dynamic> json) {
    return OutputFilterModel(id: json['id'], modelTitle: json['modelTitle']);
  }
}
