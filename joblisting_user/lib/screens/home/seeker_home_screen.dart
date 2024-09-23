import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joblisting_user/features/jobs/controller/job_controller.dart';
import 'package:joblisting_user/features/jobs/model/job_model.dart';
import 'package:joblisting_user/screens/company_details/company_details_screen.dart';
import 'package:joblisting_user/screens/company_details/widgets/skill_chip_widget.dart';
import 'package:joblisting_user/screens/jobsearch/serach_screen.dart';
import 'package:joblisting_user/screens/notification/notification_screen.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:provider/provider.dart';

class SeekerHomePage extends StatefulWidget {
  const SeekerHomePage({super.key});

  @override
  State<SeekerHomePage> createState() => _SeekerHomePageState();
}

class _SeekerHomePageState extends State<SeekerHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<JobController>().callJobAPI(context: context);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        title: Text(
          AppStrings.welcomeTxt,
          style: const TextStyle(color: Colors.white),
        ),
        toolbarHeight: screenHeight * 0.05,
        backgroundColor: MyColors.purpleButtonColor,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              Assets.homeSearch,
              width: screenWidth * 0.05,
              height: screenWidth * 0.06,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
          IconButton(
            iconSize: 20,
            icon: SvgPicture.asset(
              Assets.homeNotification,

              width: screenWidth * 0.1, // specify the desired width
              height: screenWidth * 0.12,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<JobController>(builder: (context, jobController, value) {
        if (jobController.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (jobController.jobs == null || jobController.jobs!.isEmpty) {
          return const Center(
            child: Text("No data available"),
          );
        }
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) {
                    return SkillChips(
                      isDisable: index % 2 == 0,
                      margin: const EdgeInsets.only(left: 20),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: jobController.jobs!.length,
                itemBuilder: (ctx, index) {
                  Jobs job = jobController.jobs![index];
                  return JobListCard(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CompanyDetailsScreen(
                                jobId: job.sId!,
                              )));
                    },
                    jobTitle: "UI / UX Designer",
                    jobDescription: 'Figma',
                    companyLogo: imageUrl,
                    address: job.location!,
                    experience: job.experience.toString(),
                    postedDateAgo: '20 days ago',
                    salaryRange: "\$${job.salaryAmount} / month",
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}

class JobListCard extends StatelessWidget {
  final String jobTitle;
  final String jobDescription;
  final String companyLogo;
  final String address;
  final String experience;
  final String postedDateAgo;
  final String salaryRange;
  final Function()? onTap;
  const JobListCard({
    super.key,
    required this.jobTitle,
    required this.jobDescription,
    required this.companyLogo,
    required this.address,
    required this.experience,
    required this.postedDateAgo,
    required this.salaryRange,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: size.width / 20,
            right: size.width / 20,
            bottom: size.width / 20),
        padding: EdgeInsets.symmetric(vertical: size.width * .05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: MyColors.greyDivider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .040),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.1,
                    backgroundImage: AssetImage(Assets.personProfilePic),
                  ),
                  SizedBox(
                    width: size.width / 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyAppText(
                          text: jobTitle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MyAppText(
                          text: jobDescription,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          textHeight: 28 / 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(Assets.bookMarksIcon),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .040, vertical: 15),
              child: const DottedLine(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_pin,
                    color: MyColors.lightPurpleButtonColor),
                const SizedBox(
                  width: 10,
                ),
                MyAppText(
                  text: address,
                  fontSize: 16,
                  textHeight: 24 / 16,
                  color: const Color(0xff4C5560),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .020,
            ),
            Container(
              width: size.width / 1.8,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: MyColors.offSky,
              ),
              child: MyAppText(
                  text: salaryRange,
                  fontSize: 16,
                  textHeight: 24 / 16,
                  color: MyColors.lightPurpleBgColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyAppText(
                  text: experience,
                  fontSize: 16,
                  color: MyColors.lightBlack,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.alarm,
                      color: MyColors.lightBlack,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    MyAppText(
                      text: postedDateAgo,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.lightBlack,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
