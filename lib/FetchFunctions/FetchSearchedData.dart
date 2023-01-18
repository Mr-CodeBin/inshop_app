import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> GetSearchData(String productName) async {
  var headers = {
    'X-RapidAPI-Key': 'edf1de4780msh1d402bbc4192ab0p13f9f0jsnec1635bec193',
    'X-RapidAPI-Host':
        'real-time-product-search.p.rapidapi.com\'eal-time-product-search.p.rapidapi.com'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://real-time-product-search.p.rapidapi.com/search?q=${productName}&country=in&language=10'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(await response.stream.bytesToString());
    jsonResponse["isSuccess"] = true;
    return jsonResponse;
  } else {
    return {"isSuccess": false, "data": []};
  }
}
