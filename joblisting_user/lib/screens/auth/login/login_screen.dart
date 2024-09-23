import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/screens/auth/login/widgets/login_screen2.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padd = MediaQuery.paddingOf(context);

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: Text(
          AppStrings.loginBtn,
          style: Style.titleStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: padd.add(const EdgeInsets.symmetric(
            horizontal: 40,
          )),
          child: Column(
            children: [
              Column(
                children: [
                  CustomButton(
                      buttonText: AppStrings.loginAsSeekerBtn,
                      size: size,
                      ontap: () {
                        // Provider.of<ProfileController>(context, listen: false)
                        //     .setAuthType(AuthUserType.seeker);
                        // PrefUtil.setBool(LocalConfig.isProvider, false);
                        PrefUtil.setString(LocalConfig.isProvider, 'seeker');
                        Navigator.of(context)
                            .pushReplacement(CupertinoPageRoute(
                                builder: (_) => const LoginPage(
                                      authUserType: AuthUserType.seeker,
                                    )));
                      },
                      width: UiUtils.longButtonWidth - 1.5),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 2,
                          thickness: 3,
                          color: MyColors.greyDivider,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          AppStrings.orTxt,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffA1A8B0)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          height: 2,
                          thickness: 3,
                          color: MyColors.greyDivider,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  CustomButton(
                      buttonText: AppStrings.loginAsProviderBtn,
                      size: size,
                      isTransparentButton: true,
                      ontap: () {
                        // Provider.of<ProfileController>(context, listen: false)
                        //     .setAuthType(AuthUserType.provider);
                        PrefUtil.setString(LocalConfig.isProvider, 'provider');
                        Navigator.of(context)
                            .pushReplacement(CupertinoPageRoute(
                                builder: (_) => const LoginPage(
                                      authUserType: AuthUserType.provider,
                                    )));
                      },
                      width: UiUtils.longButtonWidth - 1.5),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
