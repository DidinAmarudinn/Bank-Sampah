class ServerException implements Exception {}

class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);
}

class FetchDataException implements Exception {
  final String message;
  FetchDataException(this.message);
}

class ApiNotRespondingException implements Exception {
  final String message;
  ApiNotRespondingException(this.message);
}

class UnAuthorizedException implements Exception {
  final String message;
  UnAuthorizedException(this.message);
}
