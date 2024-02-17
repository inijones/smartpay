import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/constants/error_strings.dart';
import 'package:smartpay/core/failures/failures.dart';
import 'package:smartpay/core/network_info/network_info.dart';
import 'package:smartpay/core/runner/service.dart';
import 'package:smartpay/features/auth/data/source/remote_source.dart';
import 'package:smartpay/features/auth/model/register_item.dart';
import 'package:smartpay/features/auth/model/response_model.dart';
import 'package:smartpay/features/provider.dart';



abstract class AuthRepository {
  // Auth
  Future<Either<Failure, ResponseModel>> register({required RegisterItem registerItem});
  Future<Either<Failure, ResponseModel>> login(String email, String password);
  Future<Either<Failure, ResponseModel>> getEmailToken(String email);
  Future<Either<Failure, ResponseModel>> verifyEmailToken(String email, String token);


}

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo _networkInfo;
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required Ref ref})
      : _authRemoteDataSource = ref.read(authRemoteSourceProvider),
        _networkInfo = ref.read(networkInfoProvider);

  // Register User
  @override
  Future<Either<Failure, ResponseModel>> register(
      {required RegisterItem registerItem}) async {
    ServiceRunner<Failure, ResponseModel> sR = ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      call: _authRemoteDataSource
          .register(registerItem: registerItem)
          ,
      errorTitle: ErrorStrings.REGISTER_ERROR,
    );
  }

  // Login User
  @override
  Future<Either<Failure, ResponseModel>> login(String email, String password) async {
    ServiceRunner<Failure, ResponseModel> sR = ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      call: _authRemoteDataSource.login(email, password),
          
      errorTitle: ErrorStrings.LOG_IN_ERROR,
    );
  }

  // Login User
  @override
  Future<Either<Failure, ResponseModel>> getEmailToken(String email) async {
    ServiceRunner<Failure, ResponseModel> sR = ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      call: _authRemoteDataSource.getEmailToken(email),
          
      errorTitle: ErrorStrings.LOG_IN_ERROR,
    );
  }

  // Verify 
  @override
  Future<Either<Failure, ResponseModel>> verifyEmailToken(String email, String token) async {
    ServiceRunner<Failure, ResponseModel> sR = ServiceRunner(_networkInfo);

    return sR.tryRemoteandCatch(
      call: _authRemoteDataSource.verifyEmailToken(email, token),
          
      errorTitle: ErrorStrings.LOG_IN_ERROR,
    );
  }


}
