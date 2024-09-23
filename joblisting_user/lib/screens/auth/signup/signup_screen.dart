import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/screens/auth/forgotPassword/forgot_password.dart';
import 'package:joblisting_user/screens/auth/signup/widgets/signup_screen_form.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  final AuthUserType? authUserType;
  const SignupScreen({super.key, this.authUserType});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padd = MediaQuery.paddingOf(context);

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.goNamed('default');
          },
        ),
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: Text(
          AppStrings.signUpBtn,
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
                  ElevatedButton(
                    onPressed: () {
                      // Provider.of<ProfileController>(context, listen: false)
                      //     .setAuthType(AuthUserType.seeker);
                      // Provider.of<ProfileController>(context, listen: false)
                      //     .setAuthType(AuthUserType.seeker);
                      PrefUtil.setString(LocalConfig.isProvider, 'seeker');
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => const SignupPage(
                                authUserType: AuthUserType.seeker,
                              )));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width / 1.4, size.height / 16),
                        backgroundColor: MyColors.purpleButtonColor),
                    child: Text(
                      AppStrings.signUpAsSeekerBtn,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColors.white),
                    ),
                  ),
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
                  ElevatedButton(
                    onPressed: () {
                      // Provider.of<ProfileController>(context, listen: false)
                      //     .setAuthType(AuthUserType.provider);
                      PrefUtil.setString(LocalConfig.isProvider, 'provider');
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (_) => SignupPage(
                                authUserType: AuthUserType.provider,
                              )));
                    },
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: MyColors.purpleButtonColor),
                        minimumSize: Size(size.width / 1.4, size.height / 16),
                        backgroundColor: MyColors.white),
                    child: Text(
                      AppStrings.signUpAsProviderBtn,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColors.purpleButtonColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
