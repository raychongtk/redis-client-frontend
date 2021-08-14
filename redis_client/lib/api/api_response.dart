class ApiResponse {
  final dynamic successResult;
  final dynamic error;

  ApiResponse({
    this.successResult,
    this.error,
  });
}

T? cast<T>(x) => x is T ? x : null;
