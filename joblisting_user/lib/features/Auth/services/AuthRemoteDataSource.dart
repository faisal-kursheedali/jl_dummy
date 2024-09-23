import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/services/AuthExcpetion.dart';
import 'package:joblisting_user/ui_utils/snackBar.dart';
import 'package:joblisting_user/ui_utils/strings.dart';

class AuthRemotedatasource {
  Future<void> login({required String email, required String password}) async {
    // Map<String, dynamic> result = {};

    try {
      final String url = EndPoints.LOGIN;
      final body = jsonEncode({"email": email, "password": password});
      final headers = {
        "Content-Type": "application/json",
      };

      final res = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      final responseJson = jsonDecode(res.body);

      if (res.statusCode == 200) {
        print(responseJson);
        String jwtToken = responseJson['token'];

        //Update jwt token
        await PrefUtil.setValue("token", jwtToken);
      } else {
        throw AuthException(errorMessageCode: responseJson['message']);
      }
    } on SocketException catch (e) {
      throw AuthException(errorMessageCode: e.message);
    } on AuthException catch (e) {
      throw AuthException(errorMessageCode: e.toString());
    } catch (e) {
      print(e);
      throw AuthException(errorMessageCode: e.toString());
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name,
      required String jobProvider}) async {
    try {
      final String url = EndPoints.REGISTER;
      final body = jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "isJobProvider": jobProvider == 'provider' ? true : false,
      });

      final headers = {
        "Content-Type": "application/json",
      };

      final res = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );

      if (kDebugMode) {
        print("Response status: ${res.statusCode}");
        print("Response body: ${res.body}");
      }

      final responseJson = jsonDecode(res.body);
      if (responseJson['status'] != 'success' || res.statusCode != 201) {
        throw AuthException(errorMessageCode: responseJson['message']);
      }
      if (kDebugMode) {
        print("User registered successfully: $responseJson");
      }
      return responseJson;
    } on SocketException catch (_) {
      throw AuthException(errorMessageCode: _.message);
    } on AuthException catch (e) {
      throw AuthException(errorMessageCode: e.toString());
    } catch (e) {
      if (kDebugMode) {
        print("Exception: $e");
      }
      throw AuthException(errorMessageCode: ErrorMessage.defaultErrorMessage);
    }
  }

  Future<void> resetpassword({
    required String email,
    required String password,
  }) async {
    try {
      final String url = EndPoints.RESETPASSWORD;
      final body = jsonEncode({
        "email": email,
        "password": password,
      });

      final headers = {
        "Content-Type": "application/json",
      };

      final res = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );

      if (kDebugMode) {
        print("Response status: ${res.statusCode}");
        print("Response body: ${res.body}");
      }

      final responseJson = jsonDecode(res.body);
      if (responseJson['status'] != 'success' || res.statusCode != 201) {
        throw AuthException(errorMessageCode: responseJson['message']);
      }
      if (kDebugMode) {
        print("Password reset successfully: $responseJson");
      }
      return responseJson;
    } on SocketException catch (_) {
      throw AuthException(errorMessageCode: _.message);
    } on AuthException catch (e) {
      throw AuthException(errorMessageCode: e.toString());
    } catch (e) {
      if (kDebugMode) {
        print("Exception: $e");
      }
      throw AuthException(errorMessageCode: ErrorMessage.defaultErrorMessage);
    }
  }
}
