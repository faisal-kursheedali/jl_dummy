import 'package:flutter/material.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/screens/apply/apply_details2.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/Custom_text.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:joblisting_user/widgets/custom_textfield.dart';

class ApplyForm extends StatelessWidget {
  const ApplyForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          Assets.backButton,
          height: MediaQuery.of(context).size.height * .040,
          width: MediaQuery.of(context).size.width * .040,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 21, right: 34),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: AppStrings.fullName),
              DeatilsTextField(
                textColor: AppColor.black,
                color: AppColor.black,
                fsize: 14,
                hintText: AppStrings.userName,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              CustomText(text: AppStrings.email),
              DeatilsTextField(
                textColor: AppColor.black,
                color: AppColor.lightSky,
                fsize: 14,
                hintText: AppStrings.userEmail,
              ),
              CustomText(text: AppStrings.uploadResume),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .085,
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.lightPink,
                    border: Border.all(color: AppColor.pink)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Row(
                    children: [
                    //  Image.asset(Assets.pdffile),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .040,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(AppStrings.pdfName),
                            Text(AppStrings.pdfSize)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .158,
                      ),
                      const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 24,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .021,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              CustomText(text: AppStrings.motivationLetter),
              SizedBox(
                height: MediaQuery.of(context).size.height * .016,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColor.lightSky, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: AppStrings.motivationText,
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          color: AppColor.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .009,
              ),
              Center(
                child: CustomButton(
                  buttonText: AppStrings.applyButton,
                  size: size,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ApplyDetails2()));
                  },
                  width: UiUtils.longButtonWidth - 3,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .049,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
