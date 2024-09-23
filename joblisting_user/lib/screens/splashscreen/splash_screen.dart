import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joblisting_user/BottomnavBar/bottomNav.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isTitleVisible = false;
  bool _isTextVisible = false;

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    initialAnimationMethod();
    startAnimationMethod();
  }

  void initialAnimationMethod() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void startAnimationMethod() {
    _controller.forward().then((_) {
      setState(() {
        _isTitleVisible = true;
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isTextVisible = true;
        });
      }).then((_) {
        navigateToNextScreen();
      });
    });
  }

  void navigateToNextScreen() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final authModel = await authProvider.checkAuthStatus();
    await Future.delayed(const Duration(seconds: 2));

    if (authModel != null && authModel.isLogin) {
      // Retrieve AuthUserType from the stored AuthModel
      print(PrefUtil.getString(LocalConfig.isProvider));
      print(PrefUtil.getString(LocalConfig.isProvider) != "");
      final authUserType = authModel.isProvider;
      print(authUserType);
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => BottomNavBar(authUserType: authUserType),
        ),
      );
    } else {
      context.go('/default');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padd = MediaQuery.paddingOf(context);

    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Container(
          padding: padd
              .add(const EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    AppStrings.splashTitle,
                    style: Style.splashStyle,
                  ),
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                AnimatedOpacity(
                  opacity: _isTitleVisible ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    AppStrings.letsGetStartTxt,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                AnimatedOpacity(
                  opacity: _isTextVisible ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    maxLines: 2,
                    AppStrings.loginToEnjoyStayHealthyTxt,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
