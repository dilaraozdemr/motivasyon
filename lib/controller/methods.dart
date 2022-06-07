import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Methods {
  static Future<List> HttpGet(String uri, String controller, {int? id}) async {
    var url = Uri.https('$uri', '/${controller}');
    
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body);

      return jsonResponse;
    }
    return throw Exception('${response.statusCode}');
  }
}
