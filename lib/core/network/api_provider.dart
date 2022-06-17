import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_task/core/network/api_exception.dart';
import 'package:flutter_bloc_task/utils/app_utils.dart';

class ApiProvider {
  bool isTabBarRendered = false;
  factory ApiProvider() {
    return _singleton;
  }

  final Dio dio = Dio();
  static final ApiProvider _singleton = ApiProvider._internal();

  ApiProvider._internal() {
    // Setting up connection and response time out
    dio.options.connectTimeout = 60 * 1000;
    dio.options.receiveTimeout = 60 * 1000;
  }

  Future<dynamic> getCall(String url) async {
    dynamic responseJson;
    try {
      if (!await AppUtils.isInternetConnected()) {
        throw NoInternetException("Internet Error");
      }
      Response response = await dio.get(url);

      responseJson = response.data;
      return responseJson;
    } on SocketException {
      throw InternalServerException('Internal server error.');
    } catch (e) {
      throw ApiErrorException('Something went wrong.');
    }
  }
}
