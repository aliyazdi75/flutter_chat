class SocketEmptyResponseException implements Exception {
  final String methodName;

  SocketEmptyResponseException(this.methodName);

  @override
  String toString() => 'SocketEmptyResponseException in $methodName';
}

class SocketResponseException implements Exception {
  final String methodName;

  SocketResponseException(this.methodName);

  @override
  String toString() => 'SocketResponseException in $methodName';
}
