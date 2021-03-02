class TorchUnsupportedException implements Exception {
  TorchUnsupportedException();

  @override
  String toString() =>
      'TorchUnsupportedException: Make sure to check Torch supportability via hasTorch() method.';
}

class CameraSwitchException implements Exception {
  final String error;

  CameraSwitchException(this.error);

  @override
  String toString() => 'CameraSwitchException: $error';
}

class GettingUserMediaException implements Exception {
  final String error;

  GettingUserMediaException(this.error);

  @override
  String toString() => 'GettingUserMediaException: $error';
}

class CreatingOfferException implements Exception {
  final String error;

  CreatingOfferException(this.error);

  @override
  String toString() => 'GettingUserMediaException: $error';
}

class CreatingAnswerException implements Exception {
  final String error;

  CreatingAnswerException(this.error);

  @override
  String toString() => 'GettingUserMediaException: $error';
}
