class MotiModel {
  int? categoryId;
  String? categoryName;
  List<Promises>? promises;

  MotiModel({this.categoryId, this.categoryName, this.promises});

  MotiModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    if (json['promises'] != null) {
      promises = <Promises>[];
      json['promises'].forEach((v) {
        promises!.add(new Promises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    if (this.promises != null) {
      data['promises'] = this.promises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promises {
  int? promiseId;
  String? value;
  int? categoryId;

  Promises({this.promiseId, this.value, this.categoryId});

  Promises.fromJson(Map<String, dynamic> json) {
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