import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/BottomnavBar/bottomNav.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/app_config/helper/validators.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/screens/auth/forgotPassword/forgot_password.dart';
import 'package:joblisting_user/screens/auth/signup/widgets/signup_screen_form.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:joblisting_user/widgets/cutom_alert_dialog.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final AuthUserType? authUserType;
  const LoginPage({super.key, this.authUserType});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> showAlertDialog(BuildContext context, Size size) {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            buttonText: AppStrings.goToHomeTxt,
            size: size,
            title: AppStrings.welcomeBackTxt,
            message: AppStrings.onceAgainSuccessfullyLoginTxt,
            actions: const [],
            onTap: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => BottomNavBar(
                  authUserType: widget.authUserType,
                ),
              ));
            },
          );
        });
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(AppStrings.loginBtn),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: size.height / 20,
              ),
              TextFormField(
                controller: authProvider.loginEmailController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF9FAFB),
                    hintText: AppStrings.enterEmailHintTxt,
                    prefixIcon: const Icon(Icons.email),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(
                          0xffE5E7EB,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: Color(
                            0xffE5E7EB,
                          ),
                          width: 1.5),
                    )),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => Validators.isValidEmail(value ?? '')
                    ? null
                    : 'Please enter a valid email',
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: _obscureText,
                controller: authProvider.loginPasswordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffF9FAFB),
                  hintText: AppStrings.enterPassHintTxt,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color(
                          0xffE5E7EB,
                        ),
                        width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Color(0xffE5E7EB), width: 1.0),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length >= 6
                    ? null
                    : 'Password must be at least 6 characters',
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        CupertinoPageRoute(builder: (_) => ForgotPassword()));
                  },
                  child: Text(
                    AppStrings.forgetPassHintTxt,
                    style: TextStyle(color: MyColors.purpleButtonColor),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              authProvider.isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      buttonText: AppStrings.loginBtn,
                      size: size,
                      ontap: () async {
                        print(widget.authUserType.toString());
                        authProvider.setAuthUserType(widget.authUserType!);
                        await authProvider.callLoginApi(
                            context: context,
                            email: authProvider.loginEmailController.value.text,
                            password: authProvider
                                .loginPasswordController.value.text);
                        // await authProvider.updateLocalAuthDetails(
                        //   jwtToken: PrefUtil.getValue("token", '').toString(),
                        //   authType: widget.authUserType,
                        //   isLogin: true,
                        //   isNewUser: false,
                        // );

                        showAlertDialog(context, size);
                        if (authProvider.errorMessage != null) {}
                      },
                      width: UiUtils.longButtonWidth - 3),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(builder: (_) => const SignupPage()));
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.dontHaveAccTxt,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      TextSpan(
                        text: AppStrings.signUpBtn,
                        style: TextStyle(
                            color: MyColors.purpleButtonColor, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
