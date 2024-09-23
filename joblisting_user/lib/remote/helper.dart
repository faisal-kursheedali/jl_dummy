import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/remote/localConfig.dart';

var shouldLogout = false;

Future<void> logOut({BuildContext? context}) async {
  if (shouldLogout == false) {
    try {
      if (context!.mounted) {
        PrefUtil.remove(LocalConfig.jwtTokenKey);
        PrefUtil.remove(LocalConfig.isLoginKey);
        PrefUtil.remove(LocalConfig.isProvider);
        shouldLogout = true;
        Navigator.pushNamedAndRemoveUntil(context, "", (route) => false);
      }
    } catch (e) {
      print("Error logout is $e");
      shouldLogout = false;
    }
  }
}

// void navigateToNamedRoute(
//     {required String route,
//     required BuildContext context,
//     required bool predicate}) {
//   Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
// }
