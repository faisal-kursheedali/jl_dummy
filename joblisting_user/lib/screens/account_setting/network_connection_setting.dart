import 'package:flutter/material.dart';
import 'package:joblisting_user/appservices/network_services.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/screens/account_setting/account_privacy.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:joblisting_user/widgets/setting_card.dart';
import 'package:provider/provider.dart';

class NetWorkConnectionSetting extends StatefulWidget {
  const NetWorkConnectionSetting({super.key});

  @override
  State<NetWorkConnectionSetting> createState() =>
      _NetWorkConnectionSettingState();
}

class _NetWorkConnectionSettingState extends State<NetWorkConnectionSetting> {
  Map<String, bool> networkSettings = {
    "peopleRequest": false,
    "groupInvite": false,
    "peopleSuggestion": false,
  };
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSettings();
  }

  Future<void> fetchSettings() async {
    try {
      final settings = await NetworkConnectionService().fetchNetworkSettings();
      setState(() {
        networkSettings = settings;
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
      await NetworkConnectionService().updateNetworkSettings(networkSettings);
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
    final size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(
          child: Text(
            AppStrings.networkConnectionTxt,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: SingleChildScrollView(
                child: networkSettings["peopleSuggestion"] == true
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyDetail()),
                          );
                        },
                        child: settingCard(
                          context,
                          authProvider.authUserType == null
                              ? AppStrings.personalDetails
                              : AppStrings.companyDetailsTxt,
                          authProvider.authUserType == null
                              ? AppStrings.personalDetailsSub
                              : AppStrings.selectwhoSeeNumberTxt,
                        ),
                      )
                    : Column(
                        children: [
                          networkConnectionChanges(
                            context,
                            'peopleRequest',
                            AppStrings.peopleRequestTxt,
                            AppStrings.newConnectionReqTxt,
                          ),
                          networkConnectionChanges(
                            context,
                            'groupInvite',
                            AppStrings.groupInviteTxt,
                            AppStrings.groupInviteJoinTxt,
                          ),
                          networkConnectionChanges(
                            context,
                            'peopleSuggestion',
                            AppStrings.peopleSuggetion,
                            '',
                          ),
                          SizedBox(height: screenHeight * 0.25),
                          CustomButton(
                            buttonText: AppStrings.saveBtn,
                            ontap: () {
                              updateSettings();
                            },
                            size: size,
                            width: UiUtils.longButtonWidth - 3,
                          ),
                        ],
                      ),
              ),
            ),
    );
  }

  Widget networkConnectionChanges(
      BuildContext context, String key, String text, String subtext) {
    bool isSwitched = networkSettings[key] ?? false;
    var screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 13, top: 13),
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth * 0.2, top: screenWidth * 0.01),
                  child: Text(
                    subtext,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Switch(
            value: isSwitched,
            onChanged: (bool value) {
              setState(() {
                networkSettings[key] = value;
              });
            },
          ),
        ),
      ]),
    );
  }
}
