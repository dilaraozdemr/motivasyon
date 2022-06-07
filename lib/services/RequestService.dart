import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:motivasyon/model/model.dart';
import 'package:motivasyon/model/promiseModel.dart';


 class RequestService{
   late FormData formData;
   RequestService(){
     formData=FormData();
   }
   String baseUrlPromise = 'https://10.0.2.2:5001/api/Promises';
   String baseUrlCategory = 'https://10.0.2.2:5001/api/Categories';
   Future<List<MotiModel>?> getData(int id) async {
    try {
      var _response = await http.get(Uri.parse(baseUrlCategory+"/$id"));
      if (_response.statusCode == 200) {
        final parsed = json.decode(_response.body).cast<Map<String, dynamic>>();

        return parsed
            .map<MotiModel>((json) => MotiModel.fromJson(json))
            .toList();

      }
    } on Exception catch (ex) {
      print(ex.toString());
    }
  }
   Future<List<MotiModel>?> getDatas() async {
     try {
       var _response = await http.get(Uri.parse(baseUrlCategory));

       if (_response.statusCode == 200) {
         final parsed = json.decode(_response.body).cast<Map<String, dynamic>>();

         return parsed
             .map<MotiModel>((json) => MotiModel.fromJson(json))
             .toList();

       }
     } on Exception catch (ex) {
       print(ex.toString());
     }
   }

  Future<bool?> createDetail(int categoryId,String value) async {
    formData = FormData.fromMap({
      "CategoryId": categoryId,
      "Value":value
    });
    final response = await Dio().post(baseUrlPromise, data: formData);
    if(response.statusCode==201){
      return true;
    }else{
      return false;
    }
  }
}