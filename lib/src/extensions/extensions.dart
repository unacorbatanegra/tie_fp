part of tie_fp;

extension ResultFuture<T> on Future<T> {
  Future<Result<T>> toResult() async {
    try {
      return Success(await this);
    } catch (e, s) {
      return Failure(e, s);
    }
  }
}

extension ResultT<T> on T {
  Result<T> toSuccess() => Success(this);
}
