// import 'dart:convert';
// import 'dart:io';
// import 'dart:developer' as logger;
//
// import 'package:flutter_bloc_task/core/network/api_exception.dart';
// import 'package:flutter_bloc_task/utils/app_utils.dart';
//
// class Api {
//   static const _apiLogStart = "<<<<<<<   ";
//   static const _apiLogEnd = "   >>>>>>>";
//   static const _apiLogUrl = "URL -> ";
//   static const _apiLogHeaders = "HEADERS -> ";
//   static const _apiLogRequest = "REQUEST -> ";
//   static const _apiLogResponse = "RESPONSE -> ";
//
//   Future<dynamic> get(String url) async {
//     dynamic responseJson;
//     try {
//       if (!await AppUtils.isInternetConnected()) {
//         throw NoInternetException("Internet Error");
//       }
//       logger.log(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
//       Uri uri = Uri.parse(url);
//       final response = await http.get(uri);
//       logger.log(_apiLogStart + _apiLogResponse + response.body + _apiLogEnd);
//       responseJson = _response(response);
//     } on SocketException {
//       throw InternalServerException('Internal server error.');
//     }
//     return responseJson;
//   }
//
//   Future<dynamic> post(String url, dynamic data) async {
//     dynamic responseJson;
//     try {
//       if (!await AppUtils.isInternetConnected()) {
//         throw NoInternetException("Internet Error");
//       }
//       logger.log(_apiLogStart + _apiLogUrl + url + _apiLogEnd);
//       Uri uri = Uri.parse(url);
//       Map<String, String> headers = {"Content-Type": "application/json"};
//       logger
//           .log(_apiLogStart + _apiLogHeaders + headers.toString() + _apiLogEnd);
//       String requestBody = json.encode(data);
//       logger.log(_apiLogStart + _apiLogRequest + requestBody + _apiLogEnd);
//       final response =
//           await http.post(uri, headers: headers, body: requestBody);
//       logger.log(_apiLogStart +
//           _apiLogResponse +
//           utf8.decode(response.bodyBytes) +
//           _apiLogEnd);
//       responseJson = _response(response);
//     } on SocketException {
//       throw InternalServerException('Internal server error.');
//     }
//     return responseJson;
//   }
//
//   dynamic _response(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var body = utf8.decode(response.bodyBytes);
//         Map<String, dynamic> responseJson = json.decode(body.toString());
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//         throw InternalServerException(response.body.toString());
//       default:
//         throw FetchDataException('Fetch Error : ${response.statusCode}');
//     }
//   }
// }
