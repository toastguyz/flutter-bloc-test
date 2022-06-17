class ApiException implements Exception {
  final String _message;
  final String _prefix;

  ApiException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException(String message)
      : super(message, "Error During Data Fetching: ");
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InternalServerException extends ApiException {
  InternalServerException(String message)
      : super(message, "Internal Server Error: ");
}

class ApiErrorException extends ApiException {
  ApiErrorException(String errorMessage) : super(errorMessage, "");
}

class NoInternetException extends ApiException {
  NoInternetException(String errorMessage) : super(errorMessage, "");
}
