enum ApiType {
  fetchCryptoCurrency,
  fetchCryptoOrderBook,
}

class ApiConstant {
  static String get baseDomain =>
      'https://floridaguestdirectoryapi.admindd.com';
  static String get apiVersion => '/v2/';

  static String getValue(ApiType type) {
    switch (type) {
      case ApiType.fetchCryptoCurrency:
        return 'ticker/';
      case ApiType.fetchCryptoOrderBook:
        return 'order_book/';
      default:
        return '';
    }
  }
}
