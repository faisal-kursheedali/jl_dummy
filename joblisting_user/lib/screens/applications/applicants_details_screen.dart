import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/widgets/applicant_overview.dart';

class ApplicantsDetailsScreen extends StatefulWidget {
  ApplicantsDetailsScreen({super.key, this.open});
  String? open = 'open';

  @override
  State<ApplicantsDetailsScreen> createState() =>
      _ApplicantsDetailsScreenState();
}

class _ApplicantsDetailsScreenState extends State<ApplicantsDetailsScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Text(
          'Ui/Ux Desinger',
          style: Style.jobTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.purpleButtonColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: const Text(
                      "125 Submission",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: widget.open == 'open'
                          ? MyColors.green.withOpacity(0.2)
                          : MyColors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      widget.open == 'open' ? "Open" : "Closed",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentTab = 0;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text(
                          'Selected',
                          style: Style.tabslabelStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 2,
                          width: 80,
                          decoration: BoxDecoration(
                            color: _currentTab == 0
                                ? MyColors.black
                                : MyColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentTab = 1;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text(
                          'Rejected',
                          style: Style.tabslabelStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 2,
                          width: 80,
                          decoration: BoxDecoration(
                            color: _currentTab == 1
                                ? MyColors.black
                                : MyColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentTab = 2;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text(
                          'No Review',
                          style: Style.tabslabelStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 2,
                          width: 80,
                          decoration: BoxDecoration(
                            color: _currentTab == 2
                                ? MyColors.black
                                : MyColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: _currentTab == 0
                  ? ApplicantOverviewWidget()
                  : _currentTab == 1
                      ? ApplicantOverviewWidget()
                      : ApplicantOverviewWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
