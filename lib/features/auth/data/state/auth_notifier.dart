import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/core/failures/failures.dart';
import 'package:smartpay/features/auth/data/repository/respository.dart';
import 'package:smartpay/features/auth/model/register_item.dart';
import 'package:smartpay/features/auth/model/response_model.dart';
import 'package:smartpay/features/provider.dart';


part 'auth_states.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthStateNotifier(Ref ref)
      : _authRepository = ref.read(authRepositoryProvider),
        super(AuthInitial());

  // Auth

  // Login
  Future<void> login(
    String email,
    String password,
  ) async {
    state = LogInLoadingState();

    final loginOrError = await _authRepository.login(
      email,
      password,
    );

    state = loginOrError.fold(
      (l) => LogInFailureState(l),
      (r) => LogInSuccessState(r),
    );
  }

  // Account Verification
  Future<void> getEmailToken(
    String email,
  ) async {
    state = GetEmailTokenLoading();

    final loginOrError = await _authRepository.getEmailToken(
      email,
    );

    state = loginOrError.fold(
      (l) => GetEmailTokenFailure(l),
      (r) => GetEmailTokenSuccess(r),
    );
  }

  Future<void> verifyEmailToken(
    String email,
    String token
  ) async {
    state = VerifyEmailTokenLoading();

    final loginOrError = await _authRepository.verifyEmailToken(
      email,
      token
    );

    state = loginOrError.fold(
      (l) => VerifyEmailTokenFailure(l),
      (r) => VerifyEmailTokenSuccess(r),
    );
  }

  
}

class RegisterUserStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  RegisterUserStateNotifier(Ref ref)
      : _authRepository = ref.read(authRepositoryProvider),
        super(AuthInitial());

  Future<void> setStateInitiate() async {
    state = AuthInitial();
  }

  // Auth

  // Register
  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String fcm,
  }) async {
    state = RegisterLoadingState();

    final loginOrError = await _authRepository.register(
      registerItem: RegisterItem(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        fcm: fcm,
      ),
    );

    state = loginOrError.fold(
      (l) => RegisterFailureState(l),
      (r) => RegisterSuccessState(r),
    );
  }
}
