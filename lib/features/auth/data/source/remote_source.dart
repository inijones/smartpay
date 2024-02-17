// implement the AUTh abstarct class, so all future in it is added
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartpay/core/api/api_endpoints.dart';
import 'package:smartpay/core/network_request/network_request.dart';
import 'package:smartpay/core/network_retry/network_retry.dart';
import 'package:smartpay/features/auth/model/register_item.dart';
import 'package:smartpay/features/auth/model/response_model.dart';

abstract class AuthRemoteDataSource {
  // Auth
  Future<ResponseModel> register({required RegisterItem registerItem});
  Future<ResponseModel> login(String email, String pin);
  Future<ResponseModel> getEmailToken(String email);
  Future<ResponseModel> verifyEmailToken(String email, String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // call the two classes needed, the network request for post,get etc
  final NetworkRequest networkRequest;
  // call the two classes needed, the network retry for retrying failed API call
  final NetworkRetry networkRetry;

//  constructor to to add that the two is requried in the class
  AuthRemoteDataSourceImpl({
    required this.networkRequest,
    required this.networkRetry,
  });

  // Auth Remote Source called from the abstract class, first is to setup the abstract class

  // Auth, Pin and Code APIs

  //
  @override
  Future<ResponseModel> register({required RegisterItem registerItem}) async {
    String url = Endpoint.register; //The API URL CALL

    final body = {
      "first_name": registerItem.firstName,
      "last_name": registerItem.lastName,
      "email": registerItem.email,
      "phone_num": registerItem.phoneNumber,
      "fcm": registerItem.fcm,
    };

    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: body,
      ),
    );

    debugPrint(response.body);

    final data = await json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final ResponseModel responseModel =
            ResponseModel.fromJson(data["data"]);

        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);

      try {
        if (responseModel.status == false) {
          throw Exception(data['message']);
        } else {
          final errorMessage = data['message'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }

  @override
  Future<ResponseModel> login(String email, String password) async {
    String url = Endpoint.login; //The API URL CALL

    final body = {
      "email": email,
      "password": password,
      "device_name": "mobile"
    };

    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: body,
      ),
    );

    debugPrint(response.body);

    final data = await json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final ResponseModel user = ResponseModel.fromJson(data["data"]);

        return user;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);

      try {
        if (responseModel.status == false) {
          throw Exception(data['message']);
        } else {
          final errorMessage = data['message'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }

  @override
  Future<ResponseModel> getEmailToken(String email) async {
    String url = Endpoint.getEmailToken; //The API URL CALL

    final body = {
      "email": email,
    };

    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: body,
      ),
    );

    debugPrint(response.body);

    final data = await json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final ResponseModel responseModel =
            ResponseModel.fromJson(data["data"]);

        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);

      try {
        if (responseModel.status == false) {
          throw Exception(data['message']);
        } else {
          final errorMessage = data['message'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }

  @override
  Future<ResponseModel> verifyEmailToken(String email, String token) async {
    String url = Endpoint.login; //The API URL CALL

    final body = {
      "email": email,
      "pin": token,
    };

    final response = await networkRetry.networkRetry(
      () => networkRequest.post(
        url,
        body: body,
      ),
    );

    debugPrint(response.body);

    final data = await json.decode(response.body);

    if (response.statusCode == 200) {
      try {
        final ResponseModel responseModel =
            ResponseModel.fromJson(data["data"]);

        return responseModel;
      } on Exception catch (_) {
        rethrow;
      }
    } else {
      final ResponseModel responseModel = ResponseModel.fromJson(data);

      try {
        if (responseModel.status == false) {
          throw Exception(data['message']);
        } else {
          final errorMessage = data['message'];
          throw Exception(errorMessage);
        }
      } on Exception catch (_) {
        rethrow;
      }
    }
  }
}
