enum AuthUserType { seeker, provider }

class AuthModel {
  final bool isNewUser;
  final bool isLogin;
  final String jwtToken;
  final AuthUserType isProvider;

  AuthModel({
    required this.jwtToken,
    required this.isLogin,
    required this.isNewUser,
    required this.isProvider,
  });

  static AuthModel fromJson(Map<String, dynamic> authJson) {
    return AuthModel(
      jwtToken: authJson['jwtToken'],
      isLogin: authJson['isLogin'],
      isNewUser: authJson['isNewUser'],
      isProvider: authJson['isProvider'] == 'provider'
          ? AuthUserType.provider
          : AuthUserType.seeker,
    );
  }

  AuthModel copyWith({
    String? jwtToken,
    bool? isLogin,
    bool? isNewUser,
    AuthUserType? isProvider,
  }) {
    return AuthModel(
      jwtToken: jwtToken ?? this.jwtToken,
      isLogin: isLogin ?? this.isLogin,
      isNewUser: isNewUser ?? this.isNewUser,
      isProvider: isProvider ?? this.isProvider,
    );
  }
}
