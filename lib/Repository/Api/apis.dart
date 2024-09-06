import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_sample/Repository/model_class/number_fact_resp_model.dart';

Future<NumberFactResponse> getNumberFact({required String number}) async {
  final _response = await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  // final _bodyAsJson = jsonEncode(_response.body);
  final _bodyAsJson = jsonDecode(_response.body) as Map <String , dynamic>;
  final _data =  NumberFactResponse.fromJson(_bodyAsJson);
  return _data;

  // if (kDebugMode) {
  //   print(_bodyAsJson);
  // }
}
