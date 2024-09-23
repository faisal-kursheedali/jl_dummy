import 'package:flutter/material.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class PrivacyDetail extends StatefulWidget {
  PrivacyDetail({super.key});

  @override
  State<PrivacyDetail> createState() => _PrivacyDetailState();
}

class _PrivacyDetailState extends State<PrivacyDetail> {
  final List<String> _options = [
    'Only to Selected Candidate',
    'Only Same industry',
    'All'
  ];

  final Map<String, bool> _selectedOptions = {};
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var screenHeight = MediaQuery.of(context).size.height;
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(
          child: Text(
            AppStrings.accountPrivacy,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 51, left: 25, right: 25),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                color: MyColors.lightPurpleButtonColor.withOpacity(0.20),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: authProvider.authUserType == AuthUserType.seeker
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppStrings.showAccountDetailsTxt,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            AppStrings.onlyToMyNetwork,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          buildOption('Profile Photo', 1),
                          // Option 2
                          buildOption('Username', 2),
                          // Option 3
                          buildOption('Email Address', 3),
                          buildOption('None', 3),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppStrings.showAccountDetailsTxt,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            AppStrings.onlyToTxt,
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          buildOption('Only to Selected Candidate', 1),
                          // Option 2
                          buildOption('Only Same industry', 2),
                          // Option 3
                          buildOption('All', 3),
                        ],
                      ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.26),
          CustomButton(
            buttonText: AppStrings.saveBtn,
            size: size,
            width: UiUtils.longButtonWidth - 3,
            ontap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildOption(String title, int value) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = value; // Update selected option
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: selectedOption == value, // Check if this is selected
            onChanged: (bool? newValue) {
              setState(() {
                selectedOption = value; // Update the selected option
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
