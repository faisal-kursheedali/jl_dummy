import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';

class SkillChips extends StatelessWidget {
  final bool isDisable;
  final String skill;
  final EdgeInsets? margin;
  const SkillChips({
    super.key,
    this.isDisable = false,
    this.margin,
    this.skill = "Freelance",
  });

  @override
  Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
    return Container(
        margin: margin,
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.06, vertical: size.width*0.02),
        decoration: BoxDecoration(
          color: isDisable ? AppColor.lightGray : AppColor.purpleColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          skill,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 14,
          ),
        ));
  }
}
