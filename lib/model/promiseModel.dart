class PromiseModel {
  int? promiseId;
  String? value;
  int? categoryId;

  PromiseModel({this.promiseId, this.value, this.categoryId});

  PromiseModel.fromJson(Map<String, dynamic> json) {
    promiseId = json['promiseId'];
    value = json['value'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promiseId'] = this.promiseId;
    data['value'] = this.value;
    data['categoryId'] = this.categoryId;
    return data;
  }
}