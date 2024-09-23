import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/services/AuthLocalDataSource.dart';
import 'package:joblisting_user/features/Profile/models/user_profile_model.dart';
import 'package:joblisting_user/features/Profile/service/ProfileException.dart';

class ProfileManageRemoteDataSource {
  Future<UserProfile?> fetchUserProfile() async {
    try {
      final res = await AuthLocalDataSource().getLocalAuthDetails();
      String token = res!.jwtToken;
      final headers = {
        'Authorization': 'Bearer $token',
      };
      print(res.jwtToken);
      final response = await http.get(
        Uri.parse(EndPoints.PROFILE),
        headers: headers,
      );
      print("PROFILE:${Uri.parse(EndPoints.PROFILE)}");
      if (response.statusCode == 200) {
        print('leoo');
        return userProfileFromJson(response.body);
      } else {
        print('leoo');
        throw ProfileException(
            errorMessageCode: 'Failed to load profile: ${response.statusCode}');
      }
    } on SocketException {
      print('leoo');
      throw ProfileException(errorMessageCode: 'No Internet connection');
    } catch (e) {
      print('leoo');
      throw ProfileException(
          errorMessageCode: 'An unexpected error occurred: $e');
    }
  }

  Future<UserProfile?> updateUserProfile(
      Map<String, dynamic> body, bool isOnboard) async {
    try {
      final res = await AuthLocalDataSource().getLocalAuthDetails();
      String token = res!.jwtToken;
      final headers = {
        'Authorization': 'Bearer $token',
      };
      String endpoint =
          isOnboard ? EndPoints.OnboardNewUser : EndPoints.EditUser;
      print(res.jwtToken);
      final response =
          await http.post(Uri.parse(endpoint), headers: headers, body: body);
      print("PROFILE:${Uri.parse(EndPoints.PROFILE)}");
      if (response.statusCode == 200) {
        print('leoo');
        return userProfileFromJson(response.body);
      } else {
        print('leoo');
        throw ProfileException(
            errorMessageCode: 'Failed to load profile: ${response.statusCode}');
      }
    } on SocketException {
      print('leoo');
      throw ProfileException(errorMessageCode: 'No Internet connection');
    } catch (e) {
      print('leoo');
      throw ProfileException(
          errorMessageCode: 'An unexpected error occurred: $e');
    }
  }
}
