// implement the AUTh abstarct class, so all future in it is added
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartpay/core/api/api_endpoints.dart';
import 'package:smartpay/core/network_request/network_request.dart';
import 'package:smartpay/core/network_retry/network_retry.dart';
import 'package:smartpay/features/auth/model/register_item.dart';
import 'package:smartpay/features/auth/model/response_model.dart';
import 'package:smartpay/features/auth/model/user.dart';


abstract class AuthRemoteDataSource {
  // Auth
  Future<User> register({required RegisterItem registerItem});
  Future<User> login(String email, String pin);
 
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
  Future<User> register({required RegisterItem registerItem}) async {
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
        final User user = User.fromJson(data["data"]);

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
  Future<User> login(String email, String pin) async {
    String url = Endpoint.login; //The API URL CALL

    final body = {
      "email": email,
      "pin": pin,
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
        final User user = User.fromJson(data["data"]);

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

}
