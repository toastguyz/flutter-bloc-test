import 'package:flutter_bloc_task/feature/domain/entity/crypto_currency_response.dart';
import 'package:flutter_bloc_task/core/network/api_constant.dart';
import 'package:flutter_bloc_task/core/network/api_exception.dart';
import 'package:flutter_bloc_task/core/network/base_repository.dart';

class CryptoRepository extends BaseRepository {
  @override
  void handleApiError(dynamic errorMsg) {
    if (errorMsg is ApiException) {
      throw errorMsg;
    }
  }

  Future<CryptoCurrencyResponse> fetchCryptoCurrencyConversion(
      {required String currency}) async {
    final apiResponse =
        await getCall(ApiType.fetchCryptoCurrency, urlParam: currency);
    return CryptoCurrencyResponse.fromJson(apiResponse);
  }
}
