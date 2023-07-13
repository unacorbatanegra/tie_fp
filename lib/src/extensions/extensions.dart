part of tie_fp;

extension ResultFuture<T> on Future<T> {
  Future<Result<E>> _execute<E>(Future<E> com) async {
    try {
      final r = await com;
      return Success(r);
    } catch (e, s) {
      return Failure(e, s);
    }
  }

  Future<Result<T>> toResult() => _execute(this);
}

extension ResultT<T> on T {
  Result<T> toSuccess() => Success(this);

  Result<T> toFailure() => Failure(this);
}
