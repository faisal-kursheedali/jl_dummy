import 'package:joblisting_user/features/Profile/models/user_profile_model.dart';
import 'package:joblisting_user/features/Profile/service/ProfileManageLocalDataSource.dart';
import 'package:joblisting_user/features/Profile/service/ProfileManageRemoteDataSource.dart';

class ProfileManageRepository {
  static final ProfileManageRepository _profileRepository =
      ProfileManageRepository._internal();

  late ProfileManageRemoteDataSource _manageRemoteDataSource;
  late ProfileManageLocalDataSource _localDataSource;

  factory ProfileManageRepository() {
    _profileRepository._manageRemoteDataSource =
        ProfileManageRemoteDataSource();
    _profileRepository._localDataSource = ProfileManageLocalDataSource();
    return _profileRepository;
  }

  ProfileManageRepository._internal();

  Future<UserProfile?> getUserProfile() async {
    return await _manageRemoteDataSource.fetchUserProfile();
  }

  Future<UserProfile?> updateUserProfile(
      UserProfile user, bool isOnboard) async {
    return await _manageRemoteDataSource.updateUserProfile(
        user.toJson(), isOnboard);
  }
}
