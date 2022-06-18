import 'package:flutter_bloc_task/config/enums.dart';
import 'package:flutter_bloc_task/core/api/api_constant.dart';
import 'package:flutter_bloc_task/core/api/api_service.dart';
import 'package:flutter_bloc_task/core/base/base_response.dart';

abstract class BaseRepository {
  final apiService = ApiService();

  Future<BaseResponse> callGETMethod(ApiType type, {String? urlParam}) async {
    String apiUrl = ApiConstant.baseDomain +
        ApiConstant.apiVersion +
        ApiConstant.getValue(type);
    if (urlParam != null) apiUrl = apiUrl + urlParam;

    BaseResponse apiResponse = await apiService.callGETMethod(apiUrl);

    return apiResponse;
  }
}
