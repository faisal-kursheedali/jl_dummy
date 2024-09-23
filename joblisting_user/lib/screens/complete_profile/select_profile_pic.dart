import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/BottomnavBar/bottomNav.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/screens/auth/forgotPassword/forgot_password.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:joblisting_user/widgets/cutom_alert_dialog.dart';
import 'package:provider/provider.dart';

class AddProfilePhotoScreen extends StatefulWidget {
  final AuthUserType? authUserType;
  const AddProfilePhotoScreen({super.key, this.authUserType});
  _AddProfilePhotoScreenState createState() => _AddProfilePhotoScreenState();
}

class _AddProfilePhotoScreenState extends State<AddProfilePhotoScreen> {
  File? _selectedFile;
  String? _fileName;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title:
            // widget.authUserType == AuthUserType.seeker
            PrefUtil.getString(LocalConfig.isProvider) == 'provider'
                // PrefUtil.getBool(LocalConfig.isProvider)
                ? const Text('Add profile photo')
                : const Text('Add Company Logo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/premium-photo/liquid-text_1058674-1217.jpg?w=740'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _pickFile();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.purpleButtonColor,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: CustomButton(
                buttonText: 'Save & Continue',
                ontap: () {
                  showAlertDialog(context, size);
                },
                width: UiUtils.longButtonWidth - 2,
                size: MediaQuery.sizeOf(context),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<void> showAlertDialog(BuildContext context, Size size) {
    return showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            buttonText: AppStrings.goToHomeTxt,
            size: size,
            title: AppStrings.welcomeBackTxt,
            message: '',
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

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;

      setState(() {
        _selectedFile = File(file.path!);
        _fileName = file.name;
      });

      Provider.of<ProfileController>(context)
          .setProfileImageFile(_selectedFile!);
    }
  }
}
