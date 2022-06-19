import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_task/feature/domain/entity/crypto_currency_response.dart';

class CryptoState extends Equatable {
  const CryptoState({this.isHidden = true});

  final bool isHidden;

  @override
  List<Object?> get props => [];
}

class CryptoInitState extends CryptoState {
  const CryptoInitState() : super();
}

class CryptoLoadingState extends CryptoState {
  const CryptoLoadingState() : super();
}

class CryptoLoadedState extends CryptoState {
  const CryptoLoadedState(
      {required this.cryptoCurrencyResponse, required this.isHidden})
      : super(isHidden: isHidden);

  final CryptoCurrencyResponse cryptoCurrencyResponse;
  final bool isHidden;

  @override
  List<Object> get props => [isHidden];
}

class CryptoErrorState extends CryptoState {
  final String error;

  const CryptoErrorState({required this.error}) : super();
}
