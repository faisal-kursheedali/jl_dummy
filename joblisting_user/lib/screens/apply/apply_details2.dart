import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/widgets/custom_textfield.dart';
import '../../widgets/Custom_text.dart';

class ApplyDetails2 extends StatefulWidget {
  const ApplyDetails2({super.key});

  @override
  State<ApplyDetails2> createState() => _ApplyDetails2State();
}

class _ApplyDetails2State extends State<ApplyDetails2> {
  File? _selectedFile;
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          Assets.backButton,
          height: MediaQuery.of(context).size.height * .040,
          width: MediaQuery.of(context).size.width * .040,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 21, right: 34),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: AppStrings.fullName),
              DeatilsTextField(
                textColor: AppColor.black,
                color: AppColor.black,
                fsize: 14,
                hintText: AppStrings.userName,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              CustomText(text: AppStrings.email),
              DeatilsTextField(
                color: AppColor.lightSky,
                fsize: 14,
                hintText: AppStrings.userEmail,
              ),
              CustomText(text: AppStrings.uploadResume),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  height: MediaQuery.of(context).size.height * .135,
                  decoration: BoxDecoration(
                    image: _selectedFile == null
                        ? DecorationImage(
                            image: AssetImage(Assets.uploadImage),
                          )
                        : null,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.lightSky,
                      width: 1,
                    ),
                  ),
                  child: _selectedFile != null
                      ? Center(
                          child: Text(
                            _fileName ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              CustomText(text: AppStrings.motivationLetter),
              SizedBox(
                height: MediaQuery.of(context).size.height * .016,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColor.lightSky,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: AppStrings.motivationLetterT,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColor.lightSky,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .049,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _selectedFile = File(file.path!);
        _fileName = file.name;
      });
    }
  }
}
