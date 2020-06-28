import '../models/api_response_model.dart';
import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert' show json;

class ApiProvider {
  Client client = Client();
  final baseUrl = 'http://13.250.59.224:56321';

  Future<ApiResponseModel> fetchData(String apiEndPoint) async {
    final response = await client.get('$baseUrl$apiEndPoint');
    if (response.statusCode == 200) {
      print('Status code is 200');
      return ApiResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
