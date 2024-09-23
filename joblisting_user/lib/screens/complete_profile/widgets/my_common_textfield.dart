import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class MyCommonTextField extends StatelessWidget {
  final String hint;
  final textEditingController;
  const MyCommonTextField({
    super.key,
    required this.hint,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(
              fontSize: 12, fontWeight: FontWeight.w500, height: 18 / 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.greyDivider,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.greyDivider,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        controller: textEditingController);
  }
}
