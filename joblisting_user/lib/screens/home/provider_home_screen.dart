import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joblisting_user/screens/notification/notification_screen.dart';
import 'package:joblisting_user/screens/provider_candidate_deatils/company_details_screen.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  final List<User> users = List.generate(
    10,
    (index) => User(
      name: AppStrings.nameTxt,
      description: AppStrings.descTxt,
      job1: AppStrings.uidesignerTxt,
      job2: AppStrings.fieldTypeTxt,
      images: [
        Assets.listImage,
        Assets.listImage,
        Assets.listImage,
      ],
    ),
  );

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
            onPressed: () {},
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
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return UserCard(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => CandidateDetailsScreen(),
                ),
              );
            },
            name: user.name,
            description: user.description,
            job1: user.job1,
            job2: user.job2,
            images: user.images,
          );
        },
      ),
    );
  }
}

class User {
  final String name;
  final String description;
  final String job1;
  final String job2;
  final List<String> images;

  User(
      {required this.name,
      required this.description,
      required this.job1,
      required this.job2,
      required this.images});
}

class UserCard extends StatelessWidget {
  final String name;
  final String description;
  final String job1;
  final String job2;
  final List<String> images;
  final Function()? onTap;

  const UserCard(
      {super.key,
      this.onTap,
      required this.name,
      required this.description,
      required this.job1,
      required this.job2,
      required this.images});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: EdgeInsets.all(width * 0.056),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  radius: height * 0.04,
                  backgroundImage: AssetImage(Assets.homeProfilePic),
                ),
                SizedBox(width: width * 0.02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.010),
                      child: Text(description,
                          style: TextStyle(
                              fontSize: height * 0.015,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Row(
                      children: [
                        Container(
                          height: height * 0.032,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              color: MyColors.lightPurpleButtonColor,
                              borderRadius:
                                  BorderRadius.circular(width * 0.015)),
                          child: Center(
                            child: Text(
                              job1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.030),
                        Container(
                          height: height * 0.032,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              color: MyColors.lightPurpleButtonColor,
                              borderRadius:
                                  BorderRadius.circular(width * 0.015)),
                          child: Center(
                            child: Text(
                              job1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.15,
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.02, left: width * 0.02),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Length of 3
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(width * 0.005),
                      height: height * 0.12,
                      width: width * 0.27,
                      decoration: BoxDecoration(
                        color: MyColors.greyDivider,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        // 'assets/image$index.svg',
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ])),
    );
  }
}
