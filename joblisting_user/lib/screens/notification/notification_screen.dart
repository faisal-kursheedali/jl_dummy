import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblisting_user/ui_utils/custom_container.dart';

import '../../ui_utils/colors.dart';
import '../../ui_utils/strings.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});


  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with TickerProviderStateMixin{



  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3)..addListener(() {
      setState(() {});
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          backgroundColor: MyColors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title:
          Text(
              AppStrings.notification,
              style: Style.appBarTitleStyle,
          ),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size(50.0, 50.0),
            child: Column(
              children: [
                TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  controller: _tabController,
                  // indicatorColor: Constants.red,
                  // indicator: ShapeDecoration(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.only(
                  //             topRight: Radius.circular(8),
                  //             topLeft: Radius.circular(8),
                  //         )
                  //     ),
                  //     color: Colors.red
                  // ),
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 5.0,
                          color: MyColors.purpleButtonColor,
                      ),
                      // insets: EdgeInsets.symmetric(horizontal:16.0),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )),
                  tabs: [
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 12),
                        child: Row(
                          children: [
                            Text(
                              "All",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: (_tabController.index == 0)?MyColors.black:MyColors.unselectedColor
                              ),
                            ),

                            const SizedBox(
                              width: 5
                            ),

                            (false)?Container():CustomContainer(
                              borderRadius: 50,
                              height: 22,
                              width: 22,
                              margin: EdgeInsets.zero,
                              backgroundColor: const Color(0xffF2F4F7),
                              child: Center(
                                child: Text(
                                  "1",
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.black
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ),

                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 12),
                        child: Row(
                          children: [
                            Text(
                              "Hr",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: (_tabController.index == 1)?MyColors.black:MyColors.unselectedColor
                              ),
                            ),

                            const SizedBox(
                                width: 5
                            ),

                            (true)?Container():CustomContainer(
                              borderRadius: 50,
                              height: 22,
                              width: 22,
                              margin: EdgeInsets.zero,
                              backgroundColor: const Color(0xffF2F4F7),
                              child: Center(
                                child: Text(
                                  "1",
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.black
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ),

                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 12),
                        child: Row(
                          children: [
                            Text(
                              "Job Application",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: (_tabController.index == 2)?MyColors.black:MyColors.unselectedColor
                              ),
                            ),

                            const SizedBox(
                                width: 5
                            ),

                            (true)?Container():CustomContainer(
                              borderRadius: 50,
                              height: 22,
                              width: 22,
                              margin: EdgeInsets.zero,
                              backgroundColor: const Color(0xffF2F4F7),
                              child: Center(
                                child: Text(
                                  "1",
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.black
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ),

                  ],
                ),

              ],
            ),
          ),
        ),

        body: TabBarView(
          controller: _tabController,
          children: [
            buildAllNotification(context),
            buildAllNotification(context),
            buildAllNotification(context),
          ],
        ),

      ),
    );
  }


  Widget buildAllNotification(context) {
    return Column(
      children: [
        buildChatRequestNotificationTileWidget(context),


        divider(),

        buildNewFeatureAlertNotificationTileWidget(context),

        divider(),

        buildNormalNotificationTileWidget(context),

        divider(),

        buildViewProfileNotificationTileWidget(context),
      ],
    );
  }

  Widget divider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          child: Divider(
            color: MyColors.greyDivider,
            height: 2,
            thickness: 2,
          ),
        ),
      ],
    );
  }

  Widget buildChatRequestNotificationTileWidget(BuildContext context) {
    return Container(
      color: MyColors.notificationActiveColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 24, bottom: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomContainer(
                  height: 10,
                  width: 10,
                  backgroundColor: MyColors.purpleButtonColor,
                  padding: 0,
                  margin: EdgeInsets.zero,
                ),

                const SizedBox(
                  width: 5,
                ),

                CustomContainer(
                  height: 48,
                  width: 48,
                  borderRadius: 50,
                  backgroundColor: MyColors.containerBackground1,
                  padding: 0,
                  margin: EdgeInsets.zero,
                  child: Center(
                    child: (true)?Text(
                      "AB",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff73839B),
                      ),
                    ):Image.network(
                        'https://picsum.photos/250?image=9'
                    ),
                  ),
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: RichText(
                    text: TextSpan(

                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Ashwin Bose',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          )
                      ),
                      TextSpan(
                          text: ' ${AppStrings.isRequestingAccessTo}',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                            fontSize: 14
                          )
                      ),
                      TextSpan(
                          text: ' ${AppStrings.chatYou}',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          )
                      ),
                    ],
                  ),),
                ),

                const SizedBox(
                  height: 12,
                ),

                Row(
                  children: [
                    CustomContainer(
                      width: 76,
                      height: 32,
                      margin: EdgeInsets.zero,
                      borderRadius: 4,
                      backgroundColor: MyColors.purpleButtonColor,
                      child: Center(
                        child: Text(
                          AppStrings.accept,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MyColors.white
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 8,
                    ),

                    CustomContainer(
                      width: 76,
                      height: 32,
                      margin: EdgeInsets.zero,
                      borderRadius: 4,
                      backgroundColor: MyColors.white,
                      child: Center(
                        child: Text(
                          AppStrings.accept,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MyColors.purpleButtonColor
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),

            Text(
              "2m",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNewFeatureAlertNotificationTileWidget(BuildContext context) {
    return Container(
      color: (false)?MyColors.notificationActiveColor:MyColors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 24, bottom: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomContainer(
                  height: 10,
                  width: 10,
                  backgroundColor: (false)?MyColors.purpleButtonColor:MyColors.white,
                  padding: 0,
                  margin: EdgeInsets.zero,
                ),

                const SizedBox(
                  width: 5,
                ),

                CustomContainer(
                  height: 48,
                  width: 48,
                  borderRadius: 50,
                  backgroundColor: MyColors.containerBackground1,
                  padding: 0,
                  margin: EdgeInsets.zero,
                  child: Center(
                    child: (true)?Text(
                      "SJ",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff73839B),
                      ),
                    ):Image.network(
                        'https://picsum.photos/250?image=9'
                    ),
                  ),
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                      AppStrings.newFeatureAlert,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14
                      )
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                      "Lorem ipsum dolor sit amet consectetur. Hac morbi tristique aliquet volutpat arcu. Quisque ac ac orci eget.",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      )
                  ),
                ),



                const SizedBox(
                  height: 12,
                ),

                Row(
                  children: [
                    CustomContainer(
                      width: 86,
                      height: 32,
                      margin: EdgeInsets.zero,
                      borderRadius: 4,
                      backgroundColor: MyColors.purpleButtonColor,
                      child: Center(
                        child: Text(
                          AppStrings.accept,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: MyColors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

            Text(
              "14h",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNormalNotificationTileWidget(BuildContext context) {
    return Container(
      color: (false)?MyColors.notificationActiveColor:MyColors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 24, bottom: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomContainer(
                  height: 10,
                  width: 10,
                  backgroundColor: (false)?MyColors.purpleButtonColor:MyColors.white,
                  padding: 0,
                  margin: EdgeInsets.zero,
                ),

                const SizedBox(
                  width: 5,
                ),

                CustomContainer(
                  height: 48,
                  width: 48,
                  borderRadius: 50,
                  backgroundColor: MyColors.containerBackground1,
                  padding: 0,
                  margin: EdgeInsets.zero,
                  child: Center(
                    child: (false)?Text(
                      "S",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff73839B),
                      ),
                    ):Image.network(
                        'https://picsum.photos/250?image=9'
                    ),
                  ),
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: RichText(
                    text: TextSpan(

                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Samantha',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            )
                        ),
                        TextSpan(
                            text: ' ${AppStrings.hasSharedTheImageWithYou}',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            )
                        ),
                      ],
                    ),),
                ),


              ],
            ),

            Text(
              "14h",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildViewProfileNotificationTileWidget(BuildContext context) {
    return Container(
      color: (false)?MyColors.notificationActiveColor:MyColors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 24, bottom: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomContainer(
                  height: 10,
                  width: 10,
                  backgroundColor: (false)?MyColors.purpleButtonColor:MyColors.white,
                  padding: 0,
                  margin: EdgeInsets.zero,
                ),

                const SizedBox(
                  width: 5,
                ),

                CustomContainer(
                  height: 48,
                  width: 48,
                  borderRadius: 50,
                  backgroundColor: MyColors.containerBackground1,
                  padding: 0,
                  margin: EdgeInsets.zero,
                  child: Center(
                    child: (true)?Text(
                      "SJ",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff73839B),
                      ),
                    ):Image.network(
                        'https://picsum.photos/250?image=9'
                    ),
                  ),
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: RichText(
                    text: TextSpan(

                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Steve and 8 other',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            )
                        ),
                        TextSpan(
                            text: ' ${AppStrings.hasSharedTheImageWithYou}',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            )
                        ),
                        TextSpan(
                            text: 'Profile',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14
                            )
                        ),
                      ],
                    ),),
                ),


              ],
            ),

            Text(
              "15h",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
