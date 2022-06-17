import 'package:flutter_bloc_task/core/network/api_constant.dart';
import 'package:flutter_bloc_task/core/network/api_provider.dart';

abstract class BaseRepository {
  final apiProvider = ApiProvider();

  handleApiError(dynamic errorMsg);

  Future<dynamic> getCall(ApiType type, {String? urlParam}) async {
    String apiUrl = ApiConstant.baseDomain +
        ApiConstant.apiVersion +
        ApiConstant.getValue(type);
    if (urlParam != null) apiUrl = apiUrl + urlParam;

    dynamic apiResponse = await apiProvider.getCall(apiUrl);
    handleApiError(apiResponse);
    return apiResponse;
  }
}
