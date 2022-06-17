class CryptoCurrencyResponse {
  // int? status;
  String? message;
  CryptoCurrency? cryptoCurrency;

  CryptoCurrencyResponse({this.message, this.cryptoCurrency});

  CryptoCurrencyResponse.fromJson(dynamic json) {
    cryptoCurrency = json != null ? CryptoCurrency.fromJson(json) : null;
    message = json['errorMessage'];
  }
}

class CryptoCurrency {
  CryptoCurrency({
    this.high,
    this.last,
    this.timestamp,
    this.bid,
    this.vwap,
    this.volume,
    this.low,
    this.ask,
    this.open,
  });

  CryptoCurrency.fromJson(dynamic json) {
    high = json['high'];
    last = json['last'];
    timestamp = json['timestamp'];
    bid = json['bid'];
    vwap = json['vwap'];
    volume = json['volume'];
    low = json['low'];
    ask = json['ask'];
    open = json['open'];
  }
  String? high;
  String? last;
  String? timestamp;
  String? bid;
  String? vwap;
  String? volume;
  String? low;
  String? ask;
  String? open;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['high'] = high;
    map['last'] = last;
    map['timestamp'] = timestamp;
    map['bid'] = bid;
    map['vwap'] = vwap;
    map['volume'] = volume;
    map['low'] = low;
    map['ask'] = ask;
    map['open'] = open;
    return map;
  }
}
