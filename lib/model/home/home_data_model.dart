
// row cell 数据
class HomeDataModel {
  final int id; // 机台序号
  final String customerModel; //客户型号
  final String productSpecification; //产品规格
  final String processing; //加工工序
  final int dailyOutput; // 当天产量
  final int numberChanges; // 换机次数
  final String chief; //负责人
  final String qualityInspector; //质检员
  final String remarks; //备注

  const HomeDataModel({
    required this.id, // 机台序号
    required this.customerModel, //客户型号
    required this.productSpecification, //产品规格
    required this.processing, //加工工序
    required this.dailyOutput, // 当天产量
    required this.numberChanges, // 换机次数
    required this.chief, //负责人
    required this.qualityInspector, //质检员
    required this.remarks, //备注
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      id: json['id'] as int,
      customerModel: json['customerModel'] as String,
      productSpecification: json['productSpecification'] as String,
      processing: json['processing'] as String,
      chief: json['chief'] as String,
      qualityInspector: json['qualityInspector'] as String,
      remarks: json['remarks'] as String,
      dailyOutput: json['dailyOutput'] as int,
      numberChanges: json['numberChanges'] as int,
    );
  }
}

// column标题
class HomeTitleModel{
  final String? titleNumber; // 机台序号
  final String? titleCustomerModel; //客户型号
  final String? titleProductSpecification; //产品规格
  final String? titleProcessing; //加工工序
  final String? titleDailyOutput; // 当天产量
  final String? titleNumberChanges; // 换机次数
  final String? titleChief; //负责人
  final String? titleQualityInspector; //质检员
  final String? titleRemarks; //备注

  const HomeTitleModel({
    this.titleNumber, // 机台序号
    this.titleCustomerModel, //客户型号
    this.titleProductSpecification, //产品规格
    this.titleProcessing, //加工工序
    this.titleDailyOutput, // 当天产量
    this.titleNumberChanges, // 换机次数
    this.titleChief, //负责人
    this.titleQualityInspector, //质检员
    this.titleRemarks, //备注
  });

  factory HomeTitleModel.fromTitleJson(Map<String, dynamic> json) {
    return HomeTitleModel(
      titleNumber: json['titleNumber'],
      titleCustomerModel: json['titleCustomerModel'] as String,
      titleProductSpecification: json['titleProductSpecification'] as String,
      titleProcessing: json['titleProcessing'] as String,
      titleDailyOutput: json['titleDailyOutput'] as String,
      titleNumberChanges: json['titleNumberChanges'] as String,
      titleChief: json['titleChief'] as String,
      titleQualityInspector: json['titleQualityInspector'] as String,
      titleRemarks: json['titleRemarks'] as String,
    );
  }
}