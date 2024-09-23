import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/screens/company_details/company_details_screen.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class DatePickerButton extends StatelessWidget {
  final String title;
  final void Function(DateTime t) selectedDate;
  const DatePickerButton({
    super.key,
    this.title = "Starting Year",
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now());

        if (picked != null && picked != DateTime.now()) {
          selectedDate(picked);
        }
      },
      child: Container(
        padding: EdgeInsets.all(size.width * .05),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.purpleColor.withOpacity(.3)),
        child: Row(
          children: [
            SvgPicture.asset(Assets.calenderIcon),
            const SizedBox(
              width: 20,
            ),
            MyAppText(
              text: title,
              fontSize: 14,
              color: MyColors.purpleButtonColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
