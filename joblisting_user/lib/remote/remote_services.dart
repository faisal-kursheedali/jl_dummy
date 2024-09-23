import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/remote/helper.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/ui_utils/snackBar.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static Future<http.Response?> callPostApi(
      {required BuildContext context,
      required String url,
      required Map<String, dynamic> jsonData}) async {
    try {
      var authToken = await getAuthToken();
      log(authToken ?? "");
      final String url = EndPoints.LOGIN;
      final body = jsonEncode(jsonData);
      final headers = {
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${authToken ?? ""}',
      };

      final res = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      // final responseJson = jsonDecode(res.body);

      return res;
    } on SocketException catch (exception) {
      if (exception.message.toString().contains('jwt')) {
        showSnackBar(
            context: context, message: 'Session Expired', isSuccess: false);
        // logOut(context: context);
      } else {
        showSnackBar(
            context: context,
            isSuccess: false,
            message: exception.message.toString());

        // throw NoInternetException('No Internet');
      }
    } catch (e) {
      /*log('main catch error $e');
      final exceptionData = jsonDecode(e.toString());
      showSnackBar(
          context: context,
          isSuccess: false,
          message:
              '${exceptionData['message'].toString()} ${exceptionData['status'].toString()}');
      if (exceptionData['message'].toString() == 'jwt expired') {
        // logOut(context: context);
      }*/
      log('main catch error $e');
      final exceptionData = jsonDecode(e.toString());
      showSnackBar(
          context: context,
          isSuccess: false,
          message: exceptionData['message'].toString());
      if (exceptionData['status'].toString() == '403') {
        // logOut(context: context);
      }
      if (exceptionData['status'].toString() == '500') {
        // logOut(context: context);
      }

      if (exceptionData['message'].toString().contains('jwt')) {
        showSnackBar(
            context: context, message: 'Session Expired', isSuccess: false);
        // logOut(context: context);
      }
    }
  }

  static Future<http.Response?> callGetApi({
    required BuildContext? context,
    required String url,
    bool forLocation = false,
  }) async {
    http.Response? responseJson;
    try {
      var authToken = await getAuthToken();
      var header = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken ?? ""}',
      };
      final response =
          await http.get(Uri.parse(forLocation ? url : url), headers: header);
      log('Api Url : $url');
      log("auth Token $authToken");
      log('Api header : $header');
      log('Api response >>> : ${response.body.toString()}');

      responseJson = _returnResponse(response);
    } on SocketException catch (exception) {
      if (exception.message.toString().contains('jwt')) {
        showSnackBar(
            context: context, message: "Session Expired", isSuccess: false);
        logOut(context: context);
      } else {
        showSnackBar(
            context: context,
            isSuccess: false,
            message: exception.message.toString());

        throw Exception('No Internet');
      }
    } catch (e) {
      log('main catch error $e');
      final exceptionData = jsonDecode(e.toString());
      showSnackBar(
          context: context,
          isSuccess: false,
          message: exceptionData['message'].toString());
      if (exceptionData['status'].toString() == '403') {
        //      logOut(context: context);
      }
      if (exceptionData['status'].toString() == '500') {
        //      logOut(context: context);
      }
      if (exceptionData['message'].toString().contains('jwt')) {
        showSnackBar(
            context: context, message: 'Session Expired', isSuccess: false);
        logOut(context: context);
      }
    }

    return responseJson;
  }

  static Future<String?> getAuthToken() async {
    String? token = PrefUtil.getString(LocalConfig.jwtTokenKey);
    if (token == '') {
      return null;
    } else {
      return token;
    }
  }

  static dynamic _returnResponse(http.Response response) {
    print(response.body);
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 400:
        return response;
      case 401:
      case 403:
        throw Exception(response.body.toString());
      case 404:
        return response;
      case 406:
        return response;
      case 409:
        return response;
      case 500:
        throw Exception(response.body.toString());
      default:
        throw Exception(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
