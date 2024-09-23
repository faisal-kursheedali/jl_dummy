import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/BottomnavBar/bottomNav.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/screens/applications/applications_screen.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/widgets/cutom_alert_dialog.dart';
import 'package:provider/provider.dart';

class JobPostScreen2 extends StatelessWidget {
  const JobPostScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    Future<void> showAlertDialog(BuildContext context, Size size) {
      return showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(
              buttonText: AppStrings.visitApplication,
              size: size,
              title: AppStrings.postedSuccessfully,
              message: AppStrings.postedSuccessfullySub,
              actions: const [],
              onTap: () {
                // Provider.of<ProfileController>(context, listen: false)
                //     .setAuthType(AuthUserType.provider);
                PrefUtil.setString(LocalConfig.isProvider, 'provider');
                Navigator.of(context).pushReplacement(CupertinoPageRoute(
                    builder: (context) => BottomNavBar(
                          authUserType: AuthUserType.provider,
                        )));
              },
            );
          });
    }

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(21, 10, 31, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Job Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Company Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Job Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 6,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  showAlertDialog(context, size);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => JobPostScreen2()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.lightPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 140,
                  ),
                ),
                child: Text(
                  AppStrings.post,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
