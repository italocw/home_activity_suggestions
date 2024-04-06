import 'package:equatable/equatable.dart';

sealed class Result<T> extends Equatable {
  const Result();
}

interface class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;

  @override
  List<Object?> get props => [value];
}

interface class Failure<T> extends Result<T> {
  const Failure(this.exception);
  final Exception exception;

  @override
  List<Object?> get props => [exception];
}
