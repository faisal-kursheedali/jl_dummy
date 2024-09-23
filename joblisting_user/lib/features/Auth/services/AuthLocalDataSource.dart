import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';

class AuthLocalDataSource {
  static const String _jwtTokenKey = 'jwtToken';
  static const String _isLoginKey = 'isLogin';
  static const String _isNewUserKey = 'isNewUser';
  static const String _isProvider = 'isProvider';

  Future<void> setLocalAuthDetails(AuthModel authModel) async {
    PrefUtil.setValue(_jwtTokenKey, authModel.jwtToken);
    PrefUtil.setValue(_isLoginKey, authModel.isLogin);
    PrefUtil.setValue(_isNewUserKey, authModel.isNewUser);
    PrefUtil.setValue(_isProvider,
        authModel.isProvider == AuthUserType.provider ? 'provider' : 'seeker');
  }

  Future<AuthModel?> getLocalAuthDetails() async {
    String jwtToken = PrefUtil.getValue(_jwtTokenKey, '') as String;
    bool isLogin = PrefUtil.getValue(_isLoginKey, false) as bool;
    bool isNewUser = PrefUtil.getValue(_isNewUserKey, false) as bool;
    String isProvider = PrefUtil.getValue(_isProvider, '') as String;

    if (jwtToken.isEmpty || !isLogin) {
      return null;
    }

    return AuthModel(
      jwtToken: jwtToken,
      isLogin: isLogin,
      isNewUser: isNewUser,
      isProvider: isProvider == 'provider'
          ? AuthUserType.provider
          : AuthUserType.seeker,
    );
  }
}
