import 'package:flutter/material.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/screens/apply/apply_form.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';

class ApplySuccessful extends StatelessWidget {
  const ApplySuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .45,
          ),
          Center(
            child: Image.asset(
              Assets.successfulTask,
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.height * .15,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .021,
          ),
          Text(AppStrings.applySuccess,
              style:
                  const TextStyle(fontSize: 20, color: AppColor.purpleColor)),
          SizedBox(
            height: MediaQuery.of(context).size.height * .013,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(AppStrings.applySuccessfull,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 14, color: AppColor.lightGrey)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .042,
          ),
          CustomButton(
            buttonText: AppStrings.visitApplication,
            size: size,
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ApplyForm()));
            },
            width: UiUtils.longButtonWidth - 2.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .0235,
          ),
        ],
      ),
    );
  }
}
