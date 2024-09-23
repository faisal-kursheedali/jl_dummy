import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblisting_user/screens/company_details/company_details_screen.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class MyCommonDropDownButton extends StatelessWidget {
  final String hintText;
  final List dataList;
  final String? value;
  final void Function(String?)? onChanged;
  const MyCommonDropDownButton({super.key, required this.dataList, this.value, this.onChanged, this.hintText = "Select Board / University"});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: const Icon(Icons.keyboard_arrow_down),
      hint: MyAppText(
        text: hintText,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      isExpanded: true,
      style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, height: 18 / 12, color: Colors.black),
      decoration: InputDecoration(
        hintStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, height: 18 / 12),
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
      value: value,
      onChanged: (String? newValue) {},
      items: <String>['Option 1', 'Option 2', 'Option 3'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
