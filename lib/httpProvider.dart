import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseurl = 'https://631c37911b470e0e12fcdd0b.mockapi.io/api'; //---open_link---

class BaseProvider {
  final client = http.Client();
  //---------------------------------
  //-------GET-----
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseurl + api);

    // ignore: no_leading_underscores_for_local_identifiers
    var _headers = {
      "Authorization": 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var resposnse = await client.get(url, headers: _headers);
    if (resposnse.statusCode == 200) {
      return resposnse.body;
    } else {
      //throw exepection and catch it in UI
      throw Exception('Failed to load user details');
    }
  }

//-----POST-------
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseurl + api);
    var _payload = json.encode(object);
    var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseurl + api);
    // ignore: no_leading_underscores_for_local_identifiers
    var _loading = json.encode(object);
    // ignore: no_leading_underscores_for_local_identifiers
    var _headers = {
      "Authorization": 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };

    var resposnse = await client.put(url, body: _loading, headers: _headers);
    if (resposnse.statusCode == 201) {
      return resposnse.body;
    } else {
      //throw exepection and catch it in UI
      throw Exception('Failed to load user details');
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseurl + api);

    var resposnse = await client.delete(url);
    if (resposnse.statusCode == 200) {
      return resposnse.body;
    } else {
      //throw exepection and catch it in UI
      throw Exception('Failed to load user details');
    }
  }
}
