class NoTokenException implements Exception {
  NoTokenException();

  @override
  String toString() => 'NoTokenException: No Token is Provided';
}
