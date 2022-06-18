import 'package:flutter_bloc_task/config/enums.dart';
import 'package:flutter_bloc_task/core/base/base_repository.dart';
import 'package:flutter_bloc_task/core/base/base_response.dart';
import 'package:flutter_bloc_task/feature/domain/entity/order_book_response.dart';

class OrderBookRepository extends BaseRepository {
  Future<OrderBookResponse> fetchOrderBook({required String currency}) async {
    BaseResponse apiResponse =
        await callGETMethod(ApiType.fetchCryptoOrderBook, urlParam: currency);
    return OrderBookResponse.fromJson(apiResponse.json,
        msg: apiResponse.errMessage, statusCode: apiResponse.status);
  }
}
