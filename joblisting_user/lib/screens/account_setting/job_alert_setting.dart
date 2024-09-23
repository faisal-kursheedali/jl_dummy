import 'package:flutter/material.dart';
import 'package:joblisting_user/appservices/alert_services.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class JobAlertSetting extends StatefulWidget {
  const JobAlertSetting({super.key});

  @override
  State<JobAlertSetting> createState() => _JobAlertSettingState();
}

class _JobAlertSettingState extends State<JobAlertSetting> {
  Map<String, bool> alertSettings = {
    "newCandidateAlerts": false,
    "candidatesRecommendation": false,
    "applicationAlerts": false,
    "jobRecommendation": false,
    "applicationUpdate": false,
  };
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSettings();
  }

  Future<void> fetchSettings() async {
    try {
      final settings = await AlertServices().fetchAlertSettings();
      setState(() {
        alertSettings = settings;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching settings: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updateSettings() async {
    try {
      setState(() {
        isLoading = true;
      });
      await AlertServices().updateAlertSettings(alertSettings);
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Settings updated successfully')),
      );
    } catch (e) {
      print('Error updating settings: $e');
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update settings')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(
          child: Text(
            AppStrings.jobAertTxt,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: SingleChildScrollView(
                  child: authProvider.authUserType == AuthUserType.seeker
                      ? Column(
                          children: [
                            jobAlertChanges(
                              context,
                              'newJobAlerts',
                              'New Job  Alerts',
                              alertSettings['newJobAlerts'] ?? false,
                            ),
                            jobAlertChanges(
                              context,
                              'jobRecommendation',
                              'Job Recommendation',
                              alertSettings['jobRecommendation'] ?? false,
                            ),
                            jobAlertChanges(
                              context,
                              'applicationAlerts',
                              'Job Application Updates',
                              alertSettings['applicationAlerts'] ?? false,
                            ),
                            SizedBox(height: screenHeight * 0.35),
                            CustomButton(
                              buttonText: AppStrings.saveBtn,
                              size: size,
                              width: UiUtils.longButtonWidth - 3,
                              ontap: () {
                                updateSettings();
                              },
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            jobAlertChanges(
                              context,
                              'candidatesRecommendation',
                              'New Candidate Alert',
                              alertSettings['candidatesRecommendation'] ??
                                  false,
                            ),
                            jobAlertChanges(
                              context,
                              'candidatesRecommendation',
                              'Candidate Recommendation',
                              alertSettings['candidatesRecommendation'] ??
                                  false,
                            ),
                            jobAlertChanges(
                              context,
                              'applicationUpdate',
                              'Candidate Application Update',
                              alertSettings['applicationUpdate'] ?? false,
                            ),
                            SizedBox(height: screenHeight * 0.35),
                            CustomButton(
                              buttonText: AppStrings.saveBtn,
                              size: size,
                              width: UiUtils.longButtonWidth - 3,
                              ontap: () {
                                updateSettings();
                              },
                            ),
                          ],
                        )),
            ),
    );
  }

  Widget jobAlertChanges(
      BuildContext context, String key, String text, bool initialValue) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 13, top: 13),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 20,
            child: Switch(
              value: initialValue,
              onChanged: (bool value) {
                setState(() {
                  alertSettings[key] = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
