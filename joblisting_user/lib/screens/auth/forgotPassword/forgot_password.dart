import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/app_config/helper/validators.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/screens/auth/login/widgets/login_screen2.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final authProvider = Provider.of<AuthProvider>(context);

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
        title: Text(AppStrings.forgotPassword),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: authProvider.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                // TextFormField(
                //   controller: authProvider.nameController,
                //   decoration: InputDecoration(
                //       filled: true,
                //       fillColor: const Color(0xffF9FAFB),
                //       hintText: AppStrings.enterNameHintTxt,
                //       prefixIcon: const Icon(Icons.person),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: const BorderSide(
                //           color: Color(
                //             0xffE5E7EB,
                //           ),
                //         ),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: const BorderSide(
                //             color: Color(
                //               0xffE5E7EB,
                //             ),
                //             width: 1.5),
                //       )),
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   validator: (value) => Validators.isValidName(value ?? '')
                //       ? null
                //       : 'Please enter your name',
                // ),

                const SizedBox(height: 16),
                TextFormField(
                  controller: authProvider.resetEmailController,
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
                  controller: authProvider.resetPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF9FAFB),
                    hintText: AppStrings.enterNewPassHintTxt,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {
                        authProvider
                            .setShowPassword(!authProvider.visiblePassword);
                      },
                      icon: Icon(
                        authProvider.visiblePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
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
                      borderSide: const BorderSide(
                          color: Color(0xffE5E7EB), width: 1.0),
                    ),
                  ),
                  obscureText: authProvider.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value.length >= 6
                      ? null
                      : 'Password must be at least 6 characters',
                ),
                const SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Checkbox(
                //       value: authProvider.agreeTerms,
                //       onChanged: (value) {
                //         authProvider.setAgreeTerms(value!);
                //       },
                //     ),
                //     Flexible(
                //       child: RichText(
                //         maxLines: 2,
                //         text: TextSpan(
                //           children: [
                //             TextSpan(
                //               text: AppStrings.iAgreeTxt,
                //               style: const TextStyle(
                //                   color: Colors.grey, fontSize: 15),
                //             ),
                //             TextSpan(
                //               text: AppStrings.termsOfServiceTxt,
                //               style: TextStyle(
                //                   color: MyColors.purpleButtonColor,
                //                   fontSize: 15),
                //             ),
                //             TextSpan(
                //               text: AppStrings.andTxt,
                //               style: const TextStyle(
                //                   color: Colors.grey, fontSize: 15),
                //             ),
                //             TextSpan(
                //               text: AppStrings.privacyPolicyTxt,
                //               style: TextStyle(
                //                   color: MyColors.purpleButtonColor,
                //                   fontSize: 15),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 32),
                authProvider.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          if (authProvider.formKey.currentState?.validate() ??
                              false) {
                            final result = await authProvider.resetPassword();
                            Navigator.of(context).pushReplacement(
                                CupertinoPageRoute(
                                    builder: (_) => const LoginPage()));
                            if (authProvider.errorMessage != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(authProvider.errorMessage!)),
                              );
                            } else {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (_) => const LoginPage()));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.purpleButtonColor,
                          minimumSize: Size(size.width / 1.4, size.height / 16),
                        ),
                        child: Text(
                          AppStrings.forgotPassword,
                          style: TextStyle(color: MyColors.white, fontSize: 18),
                        ),
                      ),
                const SizedBox(height: 32),
                // TextButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //         CupertinoPageRoute(builder: (_) => const LoginPage()));
                //   },
                //   child: RichText(
                //     text: TextSpan(
                //       children: [
                //         TextSpan(
                //           text: AppStrings.alreadyHaveAccTxt,
                //           style:
                //               const TextStyle(color: Colors.grey, fontSize: 15),
                //         ),
                //         TextSpan(
                //           text: AppStrings.loginBtn,
                //           style: TextStyle(
                //               color: MyColors.purpleButtonColor, fontSize: 15),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
