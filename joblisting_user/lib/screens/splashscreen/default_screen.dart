import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joblisting_user/screens/auth/login/login_screen.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';


class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padd = MediaQuery.paddingOf(context);

    return Scaffold(
      // appBar: AppBar(
      //   leading: BackButton(),
      // ),
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Container(
          padding: padd.add(const EdgeInsets.symmetric(
            horizontal: 40,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.splashTitle,
                  style: Style.splashStyle,
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                Text(
                  AppStrings.letsGetStartTxt,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                Text(
                  maxLines: 2,
                  AppStrings.loginToEnjoyStayHealthyTxt,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                Column(
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.of(context).push(CupertinoPageRoute(
                    //         builder: (_) => const LoginScreen()));
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //       minimumSize: Size(size.width / 1.5, size.height / 16),
                    //       backgroundColor: MyColors.purpleButtonColor),
                    //   child: Text(
                    //     "Login",
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w600,
                    //         color: MyColors.white),
                    //   ),
                    // ),
                    CustomButton(
                        buttonText: AppStrings.loginBtn,
                        size: size,
                        ontap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                            builder: (_) => const LoginScreen()));
                          // Navigator.of(context).push(CupertinoPageRoute(
                          //     builder: (_) => AccountSettingScreen()));
                        },
                        width: UiUtils.longButtonWidth - 2.5),
                    SizedBox(
                      height: size.height / 40,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    // Navigator.of(context).push(CupertinoPageRoute(
                    //     builder: (_) => const SignupScreen()));
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //       side: BorderSide(color: MyColors.purpleButtonColor),
                    //       minimumSize: Size(size.width / 1.5, size.height / 16),
                    //       backgroundColor: MyColors.white),
                    //   child: Text(
                    //     "Sign Up",
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w600,
                    //         color: MyColors.purpleButtonColor),
                    //   ),
                    // ),
                    CustomButton(
                        buttonText: AppStrings.signUpBtn,
                        size: size,
                        isTransparentButton: true,
                        ontap: () {
                          context.goNamed("signup");
                        },
                        width: UiUtils.longButtonWidth - 2.3),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
