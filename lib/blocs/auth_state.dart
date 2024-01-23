part of 'auth_cubit.dart';

@immutable
abstract class AuthDartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthDartInitial extends AuthDartState {}

class AuthSuccess extends AuthDartState {
  final AuthUser user;
  AuthSuccess({required this.user});
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthDartState {
  final String error;

  AuthError({required this.error});
  @override
  List<Object?> get props => [error];
}
