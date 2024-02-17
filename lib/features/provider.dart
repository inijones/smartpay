// Auth remote source provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/core/network_request/network_request.dart';
import 'package:smartpay/core/network_retry/network_retry.dart';
import 'package:smartpay/features/auth/data/repository/respository.dart';
import 'package:smartpay/features/auth/data/source/remote_source.dart';
import 'package:smartpay/features/auth/data/state/auth_notifier.dart';

final authRemoteSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSourceImpl(
    networkRequest: ref.read(networkRequestProvider),
    networkRetry: ref.read(networkRetryProvider),
  ),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(ref: ref),
);

// State Notifier
final authStateNotifierProvider =
    StateNotifierProvider.autoDispose<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(ref),
);