import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';

enum ApplicationStatus { sent, canceled, accepted }

class ApplicationStatusScreen extends StatefulWidget {
  final ApplicationStatus? status;
  const ApplicationStatusScreen(
      {super.key, this.status = ApplicationStatus.sent});

  @override
  State<ApplicationStatusScreen> createState() =>
      _ApplicationStatusScreenState();
}

class _ApplicationStatusScreenState extends State<ApplicationStatusScreen> {
  late ApplicationStatus _status;
  bool isShowCompanyInfo = false;

  @override
  void initState() {
    _status = widget.status!;
    super.initState();
  }

  void canceledApplication() {
    setState(() {
      _status = ApplicationStatus.canceled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final pad = MediaQuery.paddingOf(context);
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(
          AppStrings.applicationStatusTxt,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 20, vertical: size.height / 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: const Color(0xffFBFCFE),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Color(0xffD3DFE7))),
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 15, vertical: size.height / 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(UiUtils.getImagePath(Assets.cbgIc)),
                        radius: 40,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppStrings.assetManagementAnalyst,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: size.height / 25),
                      Text(
                        AppStrings.consolidatedBankTxt,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff9DB2CE),
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        height: 1,
                        thickness: 2,
                        color: MyColors.greyDivider,
                        indent: 20,
                        endIndent: 20,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppStrings.circleAccraTxt,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff9DB2CE),
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 8),
                       Text(
                        AppStrings.ghPerMonthTxt,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffD3DFE7)),
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    const Color.fromARGB(179, 233, 240, 244)),
                            child: Text(
                              AppStrings.partTimeTxt,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff9DB2CE),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffD3DFE7)),
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    const Color.fromARGB(179, 233, 240, 244)),
                            child: Text(
                              AppStrings.onSiteTxt,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff9DB2CE),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppStrings.appliedEndDateTxt,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff858BBD),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height / 50),
              Text(
                AppStrings.yourAppStatusTxt,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width / 5, vertical: size.height / 40),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffD3DFE7)),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(179, 233, 240, 244)),
                child: Text(
                  _status == ApplicationStatus.sent
                      ? AppStrings.applicationSentTxt
                      : _status == ApplicationStatus.accepted
                          ? AppStrings.applicationAcceptedTxt
                          : AppStrings.applicationCanceled,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff202871),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              if (_status == ApplicationStatus.sent)
                CustomButton(
                  size: size,
                  buttonText: AppStrings.canceledApplicationTxt,
                  width: UiUtils.longButtonWidth,
                  ontap: () {
                    canceledApplication();
                  },
                ),
              if (_status == ApplicationStatus.accepted ||
                  _status == ApplicationStatus.canceled)
                CustomButton(
                  buttonText: AppStrings.viewCompanyDetailTxt,
                  size: size,
                  width: UiUtils.longButtonWidth,
                  ontap: () {
                    setState(() {
                      isShowCompanyInfo = true;
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showComanyInfo(Size size, BuildContext context) {
    return Card(
      color: const Color(0xffFBFCFE),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: Color(0xffD3DFE7))),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 15, vertical: size.height / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(UiUtils.getImagePath(Assets.cbgIc)),
              radius: 40,
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.assetManagementAnalyst,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height / 25),
            Text(
              AppStrings.consolidatedBankTxt,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff9DB2CE),
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            Divider(
              height: 1,
              thickness: 2,
              color: MyColors.greyDivider,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 8),
           Text(
              AppStrings.circleAccraTxt,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff9DB2CE),
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            Text(
              AppStrings.ghPerMonthTxt,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffD3DFE7)),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 240, 244)),
                  child: Text(
                    AppStrings.partTimeTxt,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff9DB2CE),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffD3DFE7)),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 233, 240, 244)),
                  child: Text(
                    AppStrings.onSiteTxt,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff9DB2CE),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              AppStrings.appliedEndDateTxt,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff858BBD),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
