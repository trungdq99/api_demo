import './api_result_model.dart';

class ApiResponseModel {
  List<ApiResultModel> results;
  ApiResponseModel.fromJson(Map<String, dynamic> parseJson) {
    List<ApiResultModel> temp = [];
    for (int i = 0; i < parseJson['results'].length; i++) {
      ApiResultModel apiResult =
          ApiResultModel.fromJson(parseJson['results'][i]);
      temp.add(apiResult);
    }
    results = temp;
  }
}
