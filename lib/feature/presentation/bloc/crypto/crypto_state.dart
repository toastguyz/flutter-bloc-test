import 'package:flutter_bloc_task/feature/domain/entity/crypto_currency_response.dart';

abstract class CryptoState {
  const CryptoState();
}

class CryptoInitState extends CryptoState {
  @override
  List<Object> get props => [];
}

class CryptoLoadingState extends CryptoState {
  @override
  List<Object> get props => [];
}

class CryptoLoadedState extends CryptoState {
  final CryptoCurrencyResponse cryptoCurrencyResponse;
  CryptoLoadedState({required this.cryptoCurrencyResponse});

  @override
  List<Object> get props => [];
}

class CryptoErrorState extends CryptoState {
  final String error;
  CryptoErrorState({required this.error});

  @override
  List<Object> get props => [];
}
