abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({String errorMessage = 'Server error occurred'})
      : super(errorMessage: errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure({String errorMessage = 'Cache error occurred'})
      : super(errorMessage: errorMessage);
}

class NullPointerFailure extends Failure {
  NullPointerFailure({String errorMessage = 'Null Pointer error occurred'})
      : super(errorMessage: errorMessage);
}

class StateManagementFailure extends Failure {
  StateManagementFailure(
      {String errorMessage = 'State management error occurred'})
      : super(errorMessage: errorMessage);
}
