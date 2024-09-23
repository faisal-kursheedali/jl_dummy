import 'dart:io';

import 'package:flutter/material.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Profile/models/user_profile_model.dart';
import 'package:joblisting_user/features/Profile/service/Repository.dart';

class ProfileController with ChangeNotifier {
  final ProfileManageRepository _repository = ProfileManageRepository();
  UserProfile? _userProfile;
  bool _isLoading = false;
  String? _errorMessage;

  UserProfile? get userProfile => _userProfile;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUserProfile() async {
    _isLoading = true;
    _errorMessage = null;

    try {
      final profile = await _repository.getUserProfile();
      _userProfile = profile;
    } catch (e) {
      _errorMessage = 'Failed to load profile: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool? isFromAuth;
  // AuthModel? AUTHINFO;

  // void setAuthType(AuthUserType val) {
  //   if (val == AuthUserType.provider) {
  //     AUTHINFO!.isProvider = true;
  //   } else {
  //     AUTHINFO!.isProvider = false;
  //   }
  //   notifyListeners();
  // }

// Contry selection screen
  String? countryName;

  void setCountryName(String country) {
    countryName = country;
    notifyListeners();
  }
// Personal detail screen

  TextEditingController? seekerFullNameTextController;
  TextEditingController? seekerPhoneTextController;
  // TextEditingController? seekerDOBTextController;
  DateTime? seekerDob;
  String seekerGender = 'male';

  void setProfilePageTextController() {
    seekerFullNameTextController =
        TextEditingController(text: _userProfile!.user!.name);
    seekerPhoneTextController = TextEditingController(
        text: _userProfile!.user!.additionalUserDetails!.mobileNumber);
    seekerDob = _userProfile!.user!.additionalUserDetails!.dob;
    // seekerDOBTextController = TextEditingController(
    //     text: _userProfile!.user!.additionalUserDetails!.dob.toString());
  }

  void setSeekerDob(DateTime? dob) {
    seekerDob = dob;
    notifyListeners();
  }

  void setSeekerGender(String gender) {
    seekerGender = gender;
    notifyListeners();
  }

// Education page

  List<Detail> seekerEducation = [];

  void addSeekerEducation(Detail value) {
    seekerEducation.add(value);
    notifyListeners();
  }

  void editSeekerEducation(Detail value, int index) {
    seekerEducation[index] = value;
    notifyListeners();
  }

  /// industry screen

  String? seekerIndustry;

  void setSeekerIndustry(String industry) {
    seekerIndustry = industry;
    notifyListeners();
  }

  /// Profile icon

  File? profileImagePath;

  void setProfileImageFile(File path) {
    profileImagePath = path;
    notifyListeners();
  }

  /// Provider profile
  String? companyName;

  void setIsFromAuth(bool val) {
    isFromAuth = val;
    notifyListeners();
  }

  double getProfilePercentage() {
    var user = _userProfile!.user;
    double profilePercentage = 0;

    if (user != null) {
      if (user.schoolDetails != null) {
        profilePercentage += 1;
      }
      if (user.universityDetails != null) {
        profilePercentage += 1;
      }
      if (user.additionalUserDetails != null) {
        profilePercentage += 1;
      }
      if (user.workExperience != null) {
        profilePercentage += 1;
      }
    }
    return profilePercentage / 4 * 100;
  }

  Future<void> updateProfile() async {
    _isLoading = true;
    _errorMessage = null;

    try {
      final profile =
          await _repository.updateUserProfile(_userProfile!, isFromAuth!);
      _userProfile = profile;
      if (isFromAuth!) {
        isFromAuth = false;
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to load profile: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
