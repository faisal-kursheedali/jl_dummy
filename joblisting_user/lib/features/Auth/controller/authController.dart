import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:joblisting_user/app/routes.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Auth/models/loginModel.dart';
import 'package:joblisting_user/features/Auth/services/AuthExcpetion.dart';
import 'package:joblisting_user/features/Auth/services/Repository.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/remote/navigator_services.dart';
import 'package:joblisting_user/remote/remote_services.dart';
import 'package:joblisting_user/ui_utils/snackBar.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController resetEmailController = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthUserType? _authUserType;

  bool _isLoading = false;
  String? _errorMessage;
  bool _agreeTerms = false;
  bool _isShowPassword = true;
  bool _isJobProvider = false;

  AuthUserType? get authUserType => _authUserType;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get agreeTerms => _agreeTerms;
  bool get visiblePassword => _isShowPassword;
  bool get isjobProvider => _isJobProvider;

  LoginModel? loginModel;
  User? user;

  void setAuthUserType(AuthUserType type) {
    log(type.toString());
    _authUserType = type;
    _isJobProvider = type == AuthUserType.provider;
    notifyListeners();
  }

  void setAgreeTerms(bool value) {
    _agreeTerms = value;
    notifyListeners();
  }

  void setShowPassword(bool value) {
    _isShowPassword = value;
    notifyListeners();
  }

  // Future<void> login() async {
  //   _setLoading(true);
  //   try {
  //     final res = await _authRepository.login(
  //         email: resetEmailController.text,
  //         password: resetPasswordController.text);
  //     _setErrorMessage(null);
  //     return res;
  //   } on AuthException catch (e) {
  //     _setErrorMessage(e.errorMessageCode);
  //   } finally {
  //     _setLoading(false);
  //   }
  // }

  Future<void> callLoginApi({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    // showLoader(context);
    _setLoading(true);
    try {
      final data = await RemoteServices.callPostApi(
        url: EndPoints.LOGIN,
        context: context,
        jsonData: {
          "email": email,
          "password": password,
        },
      );

      if (data == null) {
        // hideLoader(context);
        _setLoading(false);
        showSnackBar(
          context: context,
          message: 'No response from server.',
          isSuccess: false,
        );
        return;
      }
      final loginResponse = LoginModel.fromJson(jsonDecode(data.body));

      if (context.mounted) {
        _setLoading(false);
        if (data.statusCode == 200 || data.statusCode == 201) {
          loginModel = loginResponse;
          user = loginResponse.user;
          PrefUtil.setString(
              LocalConfig.jwtTokenKey, loginResponse.token ?? "");
          PrefUtil.setString(LocalConfig.name, user?.name ?? "");

          PrefUtil.setString(LocalConfig.email, user?.email ?? "");
          PrefUtil.setBool(LocalConfig.isLoginKey, true);
          print(user!.name);
          // NavigatorService.pushNamedAndRemoveUntil(AppRouter.defaultlRoute);
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (con)))

          print("object");
          showSnackBar(
            context: context,
            message: loginResponse.message,
            isSuccess: true,
          );
          notifyListeners();
        } else {
          showSnackBar(
            context: context,
            message: loginResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      // Handle exceptions
      _setLoading(false);
      showSnackBar(
        context: context,
        message: 'An error occurred: $e',
        isSuccess: false,
      );
    } finally {
      _setLoading(false);
      // hideLoader(context);
      notifyListeners();
    }
  }

  Future<void> callSignupApi({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String isJobProvider,
  }) async {
    // showLoader(context);
    _setLoading(true);
    try {
      final data = await RemoteServices.callPostApi(
        url: EndPoints.LOGIN,
        context: context,
        jsonData: {
          "email": email,
          "password": password,
          "name": name,
          "isJobProvider": isJobProvider == 'provider' ? true : false,
        },
      );

      if (data == null) {
        // hideLoader(context);
        _setLoading(false);
        showSnackBar(
          context: context,
          message: 'No response from server.',
          isSuccess: false,
        );
        return;
      }
      final loginResponse = LoginModel.fromJson(jsonDecode(data.body));
      if (context.mounted) {
        _setLoading(false);
        if (data.statusCode == 200 || data.statusCode == 201) {
          loginModel = loginResponse;
          user = loginResponse.user;
          PrefUtil.setString(
              LocalConfig.jwtTokenKey, loginResponse.token ?? "");
          PrefUtil.setString(LocalConfig.name, user?.name ?? "");

          PrefUtil.setString(LocalConfig.email, user?.email ?? "");
          PrefUtil.setBool(LocalConfig.isLoginKey, true);

          // NavigatorService.pushNamedAndRemoveUntil(AppRouter.defaultlRoute);
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (con)))

          print("object");
          showSnackBar(
            context: context,
            message: loginResponse.message,
            isSuccess: true,
          );
          notifyListeners();
        } else {
          showSnackBar(
            context: context,
            message: loginResponse.message,
            isSuccess: false,
          );
        }
      }
    } catch (e) {
      // Handle exceptions
      _setLoading(false);
      showSnackBar(
        context: context,
        message: 'An error occurred: $e',
        isSuccess: false,
      );
    } finally {
      _setLoading(false);
      // hideLoader(context);
      notifyListeners();
    }
  }

  // Future<AuthUserType> getAuthType() async {
  //   final res = await _authRepository.checkAuthStatus();
  //   return res!.isProvider;
  // }

  // Future<void> register() async {
  //   _setLoading(true);
  //   try {
  //     await _authRepository.register(
  //         email: signUpEmailController.text,
  //         password: signUpPasswordController.text,
  //         name: nameController.text,
  //         jobprovider: isjobProvider);
  //     _setErrorMessage(null);
  //   } on AuthException catch (e) {
  //     _setErrorMessage(e.errorMessageCode);
  //   } finally {
  //     _setLoading(false);
  //   }
  // }

  Future<void> updateLocalAuthDetails(
      {String? jwtToken,
      bool? isLogin,
      bool? isNewUser,
      AuthUserType? authType}) async {
    await _authRepository.setLocalAuthDetails(
        jwtToken: jwtToken,
        isLogin: isLogin,
        isNewUser: isNewUser,
        isProvider: authType);
  }

  Future<AuthModel?> checkAuthStatus() async {
    final authModel = await _authRepository.checkAuthStatus();
    return authModel;
  }

  Future<void> resetPassword() async {
    _setLoading(true);
    try {
      await _authRepository.resetpassword(
        email: resetEmailController.text,
        password: resetPasswordController.text,
      );
      _setErrorMessage(null);
    } on AuthException catch (e) {
      _setErrorMessage(e.errorMessageCode);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> singout(BuildContext context) async {
    _setLoading(true);
    try {
      await _authRepository.signOut(context);
      _setErrorMessage(null);
    } on AuthException catch (e) {
      _setErrorMessage(e.errorMessageCode);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
