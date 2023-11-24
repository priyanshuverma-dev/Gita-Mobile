import 'package:fpdart/fpdart.dart';
import 'package:gita_mobile/core/internals/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
