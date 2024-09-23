import 'package:flutter/material.dart';
import 'package:joblisting_user/screens/applications/job_post_form.dart';
import 'package:joblisting_user/screens/jobsearch/filters_screen.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/widgets/job_overview.dart';

class ApplicationsScreen extends StatefulWidget {
  const ApplicationsScreen({super.key});

  @override
  State<ApplicationsScreen> createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Text(
          AppStrings.applicationTitle,
          style: Style.pagetitleStyle,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Open',
                        style: Style.tabslabelStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        width: 80,
                        decoration: BoxDecoration(
                          color:
                              currentTab == 0 ? MyColors.black : MyColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Closed',
                        style: Style.tabslabelStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        width: 80,
                        decoration: BoxDecoration(
                          color:
                              currentTab == 1 ? MyColors.black : MyColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: currentTab == 0
                  ? JobOverviewWidget(open: 'open')
                  : JobOverviewWidget(open: 'closed'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.all(20),
        elevation: 0,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          0,
        ),
        // icon: SvgPicture.asset(
        // //  Assets.jobIcon,
        // ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const JobPostForm()),
          );
        },
        label: Text(
          " Post Job ",
          style: Style.buttontitleStyle,
        ),
      ),
    );
  }
}
