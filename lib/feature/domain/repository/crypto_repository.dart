import 'package:flutter_bloc_task/config/enums.dart';
import 'package:flutter_bloc_task/core/base/base_repository.dart';
import 'package:flutter_bloc_task/core/base/base_response.dart';
import 'package:flutter_bloc_task/feature/domain/entity/crypto_currency_response.dart';

class CryptoRepository extends BaseRepository {
  Future<CryptoCurrencyResponse> fetchCryptoCurrencyConversion(
      {required String currency}) async {
    BaseResponse apiResponse =
        await callGETMethod(ApiType.fetchCryptoCurrency, urlParam: currency);
    return CryptoCurrencyResponse.fromJson(apiResponse.json,
        msg: apiResponse.errMessage,
        statusCode: apiResponse.status,
        val: currency);
  }
}
