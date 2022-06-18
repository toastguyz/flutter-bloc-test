import 'package:flutter_bloc_task/feature/domain/entity/crypto_currency_response.dart';

abstract class CryptoState {
  const CryptoState();
}

class CryptoInitState extends CryptoState {}

class CryptoLoadingState extends CryptoState {}

class CryptoLoadedState extends CryptoState {
  final CryptoCurrencyResponse cryptoCurrencyResponse;

  CryptoLoadedState({required this.cryptoCurrencyResponse});
}

class CryptoErrorState extends CryptoState {
  final String error;

  CryptoErrorState({required this.error});
}
