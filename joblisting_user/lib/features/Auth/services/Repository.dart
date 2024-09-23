import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Auth/models/loginModel.dart';
import 'package:joblisting_user/features/Auth/services/AuthLocalDataSource.dart';
import 'package:joblisting_user/features/Auth/services/AuthRemoteDataSource.dart';
import 'package:joblisting_user/remote/remote_services.dart';
import 'package:joblisting_user/screens/auth/login/login_screen.dart';

class AuthRepository {
  static final AuthRepository _authRepository = AuthRepository._internal();

  late AuthRemotedatasource _authRemoteDataSource;
  late AuthLocalDataSource _localDataSource;

  factory AuthRepository() {
    _authRepository._authRemoteDataSource = AuthRemotedatasource();
    _authRepository._localDataSource = AuthLocalDataSource();
    return _authRepository;
  }
  AuthRepository._internal();

  Future<void> login({required String email, required String password}) async {
    return await _authRemoteDataSource.login(email: email, password: password);
  }

  // Future<LoginModel> loginUser(
  //     {required BuildContext context,
  //     required Map<String, dynamic> reqBody}) async {
  //   await RemoteServices.loginUser(context: context, reqBody: reqBody);
  // }

  Future<void> register(
      {required String email,
      required String password,
      required String name,
      required String jobprovider}) async {
    return _authRemoteDataSource.register(
        email: email, password: password, name: name, jobProvider: jobprovider);
  }

  Future<void> resetpassword({
    required String email,
    required String password,
  }) async {
    return _authRemoteDataSource.resetpassword(
      email: email,
      password: password,
    );
  }

  Future<void> setLocalAuthDetails({
    String? jwtToken,
    bool? isLogin,
    bool? isNewUser,
    AuthUserType? isProvider,
  }) async {
    AuthModel authModel = AuthModel(
      jwtToken: jwtToken!,
      isLogin: isLogin!,
      isNewUser: isNewUser!,
      isProvider: isProvider ?? AuthUserType.seeker,
    );
    await _localDataSource.setLocalAuthDetails(authModel);
  }

  Future<AuthModel?> checkAuthStatus() async {
    return _localDataSource.getLocalAuthDetails();
  }

  Future<void> signOut(BuildContext context) async {
    //remove fcm token when user logout
    try {
      // _authRemoteDataSource.updateFcmId(
      //     firebaseId: AuthLocalDataSource.getUserFirebaseId(),
      //     userLoggingOut: true);
      // _authRemoteDataSource.signOut(authProvider);
      setLocalAuthDetails(
          isProvider: null, jwtToken: "", isLogin: false, isNewUser: false);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const LoginScreen()),
      //   // (_) => false
      // );
    } catch (e) {}
  }

  Future<void> logOut() async {
    //remove fcm token when user logout
    try {
      // _authRemoteDataSource.updateFcmId(
      //     firebaseId: AuthLocalDataSource.getUserFirebaseId(),
      //     userLoggingOut: true);
      // _authRemoteDataSource.signOut(authProvider);
      setLocalAuthDetails(
          isProvider: null, jwtToken: "", isLogin: false, isNewUser: false);
    } catch (e) {}
  }
}
