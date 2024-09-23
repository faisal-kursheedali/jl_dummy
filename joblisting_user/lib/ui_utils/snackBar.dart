import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/space.dart';

void showSnackBar({
  BuildContext? context,
  String? message,
  bool isSuccess = true,
}) {
  final snackBar = SnackBar(
    elevation: 6,
    duration: const Duration(milliseconds: 2500),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        isSuccess
            ? const Icon(Icons.check, color: Colors.white)
            : const Icon(Icons.error_outline_rounded, color: Colors.white),
        kWidthGap(10),
        Flexible(
            child: Text(
          message ?? "",
          style: const TextStyle(
            color: Colors.white,
          ),
          overflow: TextOverflow.fade,
        )),
      ],
    ),
    backgroundColor: isSuccess ? Colors.green : Colors.red,
  );
  ScaffoldMessenger.of(context!).showSnackBar(snackBar);
}
