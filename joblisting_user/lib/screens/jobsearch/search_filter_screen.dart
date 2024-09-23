import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/constant/app_colors.dart';
import '../../ui_utils/assets.dart';
import '../company_details/company_details_screen.dart'; // Assuming AppColor is defined in this file

class SearchFilterScreen extends StatelessWidget {
  const SearchFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // Hide the default AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            Assets.searchIc,
                            width: 24,
                            height: 24,
                            color: AppColor.lightPurple,
                          ),
                        ),
                        hintText: 'Animators',
                        hintStyle: const TextStyle(fontSize: 16),
                        contentPadding: const EdgeInsets.all(10.0),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            Assets.vector,
                            width: 20,
                            height: 20,
                            color: AppColor.lightPurple,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColor.purpleColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "All",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColor.purpleColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Freelance",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Full - time",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      color: AppColor.lightGray,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  _buildJobCard(screenWidth),
                  const SizedBox(height: 20),
                  _buildJobCard(screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(double screenWidth) {
    const imageUrl = "https://cdn4.iconfinder.com/data/icons/logos-brands-in-colors/3000/figma-logo-512.png";// Replace with actual image URL

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
              const Icon(
                Icons.badge,
                color: AppColor.grayColor,
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
              Icon(Icons.location_pin, color: Colors.lightBlue,
                size: 40,),
              SizedBox(
                width: 10,
              ),
              MyAppText(
                text: "Lorem ipsum dolor.",
                fontSize: 20,
                textHeight: 24 / 16,
                color: Color(0xff4C5560),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const MyAppText(text: "\$15k - \$25k / month", fontSize: 16, textHeight: 24 / 16, color: AppColor.lightPurple),
          const SizedBox(
            height: 15,
          ),

          const SizedBox(
            height: 25,
          ),
          Container(
            child:  const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyAppText(
                  text: "1.5 years",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  textHeight: 24 / 16,
                  color: Color(0xff4C5560),
                ),
                SizedBox(width: 50,),
                Icon(
                  Icons.alarm,
                  color: AppColor.grayColor,
                ),
                SizedBox(
                  width: 10,
                ),
                MyAppText(
                  text: "20 Days ago",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  textHeight: 24 / 16,
                  color: Color(0xff4C5560),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
