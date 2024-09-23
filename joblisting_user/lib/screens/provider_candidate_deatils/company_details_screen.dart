import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblisting_user/app/constant/app_colors.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/screens/apply/apply_details2.dart';
import 'package:joblisting_user/screens/apply/apply_form.dart';
import 'package:joblisting_user/screens/auth/login/widgets/login_screen2.dart';
import 'package:joblisting_user/screens/company_details/widgets/skill_chip_widget.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';

class CandidateDetailsScreen extends StatelessWidget {
  const CandidateDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(leading: BackButton()),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          children: [
                            MyAppText(
                              text: "UI / UX Designer",
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            MyAppText(
                              text: "Lorem ipsum dolor.",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              textHeight: 24 / 16,
                              color: AppColor.grayColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const DottedLine(
                      dashColor: Color(0xff596574),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_pin, color: AppColor.purpleColor),
                        SizedBox(
                          width: 10,
                        ),
                        MyAppText(
                          text: "Lorem ipsum dolor.",
                          fontSize: 16,
                          textHeight: 24 / 16,
                          color: Color(0xff4C5560),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const MyAppText(
                        text: "\$15k - \$25k / month",
                        fontSize: 16,
                        textHeight: 24 / 16,
                        color: AppColor.lightPurple),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.alarm,
                          color: AppColor.grayColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MyAppText(
                          text: "1 Month ago",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          textHeight: 24 / 16,
                          color: Color(0xff4C5560),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 10, horizontal: 8),
                    //   decoration: BoxDecoration(
                    //       color: AppColor.purpleColor,
                    //       borderRadius: BorderRadius.circular(25)),
                    //   child: const MyAppText(
                    //       text: "Apply For Job",
                    //       fontSize: 14,
                    //       textHeight: 24 / 14,
                    //       color: Colors.white),
                    // )
                    CustomButton(
                        buttonText: AppStrings.contact,
                        size: size,
                        ontap: () {
                          // Navigator.of(context).pushReplacement(
                          //   CupertinoPageRoute(
                          //     builder: (_) => ApplyDetails2(),
                          //   ),
                          // );
                        },
                        width: UiUtils.mediumButtonWidth - 1.5)
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.0),
                    border: const Border(
                      bottom:
                          BorderSide(color: AppColor.lightBlack, width: 0.8),
                    ),
                  ),
                  child: TabBar(
                      labelPadding: EdgeInsets.zero,
                      labelStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColor.purpleColor),
                      unselectedLabelStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColor.lightBlack),
                      indicatorColor: AppColor.purpleColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(
                          text: "Job Profile",
                        ),
                        Tab(
                          text: "Qualification",
                        ),
                        Tab(
                          text: "Skills",
                        ),
                      ])),
              const Expanded(
                child: TabBarView(
                  children: [
                    ProfileTabView(),
                    ProfileTabView(),
                    SkillTabView()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SkillTabView extends StatelessWidget {
  const SkillTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Wrap(
        spacing: 5,
        runSpacing: 20,
        children: List.generate(
            10,
            (index) => SkillChips(
                  isDisable: (index % 2 == 0) ? true : false,
                )),
      ),
    );
  }
}

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (ctx, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: CircleAvatar(
                      radius: 2,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: MyAppText(
                      text: loremText,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColor.grayColor,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class MyAppText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? textHeight;
  final Color? color;
  const MyAppText({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.textHeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 20,
        height: textHeight ?? 25 / 20,
        color: color ?? Colors.black,
      ),
    );
  }
}

const String imageUrl =
    "https://cdn4.iconfinder.com/data/icons/logos-brands-in-colors/3000/figma-logo-512.png";

const String loremText =
    """Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. """;
