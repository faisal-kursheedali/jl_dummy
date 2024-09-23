import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/features/Profile/models/user_profile_model.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/screens/account_setting/helper.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
// import 'package:joblisting_user/widgets/button.dart';
import 'package:joblisting_user/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileController>(context, listen: false).fetchUserProfile();
  }

  @override
  void dispose() {
    Provider.of<ProfileController>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final size = MediaQuery.sizeOf(context);
    final authprovider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(
            child: Text(
          AppStrings.accountTxt,
          style: const TextStyle(fontWeight: FontWeight.w800),
        )),
      ),
      body: Consumer<ProfileController>(builder: (context, controller, child) {
        return Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  profileWithName(screenWidth, screenHeight),
                  buildNarrowScreenLayout(screenWidth, screenHeight,
                      controller.userProfile ?? UserProfile())
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildNarrowScreenLayout(
      double screenWidth, double screenHeight, UserProfile? userprofile) {
    final size = MediaQuery.sizeOf(context);
    final authprovider = Provider.of<AuthProvider>(context);
    DateFormat format = DateFormat('dd-MM-yyyy');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.01),
        Text(
          AppStrings.accountAndFinancingTxt,
          style:
              TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey[600]),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.57),
          child: Text(
            AppStrings.profileInfoTxt,
            style: TextStyle(
                fontSize: screenWidth * 0.05, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CustomTextField1(
          hintText: AppStrings.hintTxt,
          value: userprofile?.user?.name ?? 'N/A',
          icon: Assets.accountIc,
        ),
        CustomTextField1(
          hintText: AppStrings.emailAddHintTxt,
          value: userprofile?.user?.email ?? 'N/A',
          icon: Assets.emailIc,
        ),
        CustomTextField1(
          hintText: AppStrings.mobileNumberHintTxt,
          value:
              userprofile?.user?.additionalUserDetails?.mobileNumber ?? 'N/A',
          icon: Assets.callIc,
        ),
        CustomTextField1(
          hintText: AppStrings.dateOfBirthHintTxt,
          value: userprofile?.user?.additionalUserDetails?.dob != null
              ? format.format(userprofile!.user!.additionalUserDetails!.dob!)
              : 'N/A',
          icon: Assets.calendarIc,
        ),
        CustomTextField1(
          hintText: AppStrings.genderHintTxt,
          value: AppStrings.genderHintTxt,
          icon: Assets.genderIc,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.65),
          child: Text(
            AppStrings.addressTxt,
            style: TextStyle(
                fontSize: screenWidth * 0.05, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CustomTextField1(
          hintText: AppStrings.pincodeHintTxt,
          value: AppStrings.pincodeHintTxt,
          icon: Assets.locationIc,
        ),
        CustomTextField1(
          hintText: AppStrings.landMarkLocalityHintTxt,
          value: AppStrings.landMarkLocalityHintTxt,
          icon: Assets.buildingIc,
        ),
        CustomTextField1(
          hintText: AppStrings.flatNumAndStreetNameHintTxt,
          value: userprofile?.user?.additionalUserDetails?.address ?? 'N/A',
          icon: Assets.addressIc,
        ),
        SizedBox(
          height: screenHeight * 0.2,
        ),
        CustomButton(
          buttonText: AppStrings.saveBtn,
          ontap: () {},
          size: size,
          width: UiUtils.longButtonWidth - 3,
        ),
        SizedBox(
          height: screenHeight * 0.011,
        ),
        CustomButton(
          buttonText: "Logout",
          ontap: () async {
            print(PrefUtil.getString(LocalConfig.isProvider));
            await authprovider.singout(context);
            print(PrefUtil.getString(LocalConfig.isProvider));
            context.goNamed('default');
          },
          size: size,
          width: UiUtils.longButtonWidth - 3,
        ),
      ],
    );
  }
}
