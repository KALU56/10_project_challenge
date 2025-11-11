// features/auth/presentation/blocs/auth/auth_state.dart
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

// Initial
class AuthInitial extends AuthState {}

// Loading
class AuthLoading extends AuthState {}

// Success
class AuthSuccess extends AuthState {
  final dynamic data;
  const AuthSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

// Failure
class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}
