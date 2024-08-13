part of tie_fp;

extension ResultFuture<T> on Future<T> {
  /// Convert a Future to a Result
  /// set [report] to false to disable error logging
  ///
  Future<Result<T>> toResult({bool report = true}) async {
    try {
      return Success(await this);
    } catch (e, s) {
      return Failure(e, stackTrace: s, report: report);
    }
  }
}

extension ResultT<T> on T {
  Result<T> toSuccess() => Success(this);
}
