import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure();
}

class ServerFailure extends Failure {
  const ServerFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'ServerFailure{errorMessage: $errorMessage}';
  }
}

class CacheFailure extends Failure {
  const CacheFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'CacheFailure{errorMessage: $errorMessage}';
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'NetworkFailure{errorMessage: $errorMessage}';
  }
}

class CancelFailure extends Failure {
  const CancelFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'CancelFailure{errorMessage: $errorMessage}';
  }
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'TimeoutFailure{errorMessage: $errorMessage}';
  }
}

class UnknownFailure extends Failure {
  const UnknownFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'UnknownFailure{errorMessage: $errorMessage}';
  }
}

class AuthFailure extends Failure {
  const AuthFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'AuthFailure $errorMessage';
  }
}

class FetchFailure extends Failure {
  const FetchFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'FetchFailure $errorMessage';
  }
}

class InsertFailure extends Failure {
  const InsertFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'InsertFailure $errorMessage';
  }
}

class UpdateFailure extends Failure {
  const UpdateFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'UpdateFailure $errorMessage';
  }
}

class DeleteFailure extends Failure {
  const DeleteFailure({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return 'DeleteFailure $errorMessage';
  }
}
