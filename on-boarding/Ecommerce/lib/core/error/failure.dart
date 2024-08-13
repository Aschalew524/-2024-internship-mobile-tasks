import 'package:equatable/equatable.dart';

// Base Failure class

class Failure extends Equatable {
  final String message;
  
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Specific Failure types
class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error']) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Network error']) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure([String message = 'Database error']) : super(message);
}
