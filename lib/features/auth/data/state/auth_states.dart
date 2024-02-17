part of 'auth_notifier.dart';

class AuthState {}

class AuthInitial extends AuthState {}

// Log In States
class LogInLoadingState extends AuthState {}

class LogInFailureState extends AuthState {
  final Failure failure;

  LogInFailureState(this.failure);
}

class LogInSuccessState extends AuthState {
  final ResponseModel responseModel;

  LogInSuccessState(this.responseModel);
}

// Register State
class RegisterLoadingState extends AuthState {}

class RegisterFailureState extends AuthState {
  final Failure failure;

  RegisterFailureState(this.failure);
}

class RegisterSuccessState extends AuthState {
  final ResponseModel responseModel;

  RegisterSuccessState(this.responseModel);
}

// Account Verification
class GetEmailTokenLoading extends AuthState {}

class GetEmailTokenFailure extends AuthState {
  final Failure failure;

  GetEmailTokenFailure(this.failure);
}

class GetEmailTokenSuccess extends AuthState {
  final ResponseModel responseModel;

  GetEmailTokenSuccess(this.responseModel);
}

// Resend Verification State
class VerifyEmailTokenLoading extends AuthState {}

class VerifyEmailTokenFailure extends AuthState {
  final Failure failure;

  VerifyEmailTokenFailure(this.failure);
}

class VerifyEmailTokenSuccess extends AuthState {
  final ResponseModel responseModel;

  VerifyEmailTokenSuccess(this.responseModel);
}
