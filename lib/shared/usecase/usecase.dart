import 'package:dartz/dartz.dart';
import 'package:virtual_wearing_app_flutter/shared/error/failures.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
