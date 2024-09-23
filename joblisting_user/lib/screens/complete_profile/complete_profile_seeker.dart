import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/features/Profile/models/user_profile_model.dart';
import 'package:joblisting_user/screens/company_details/company_details_screen.dart';
import 'package:joblisting_user/screens/complete_profile/select_industry.dart';
import 'package:joblisting_user/screens/complete_profile/widgets/my_common_dropdown.dart';
import 'package:joblisting_user/screens/complete_profile/widgets/my_common_textfield.dart';
import 'package:joblisting_user/screens/complete_profile/widgets/my_date_picker_button.dart';
import 'package:joblisting_user/screens/home/seeker_home_screen.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SeekerCompleteProfile extends StatefulWidget {
  final AuthUserType? authUserType;
  const SeekerCompleteProfile({super.key, this.authUserType});

  @override
  State<SeekerCompleteProfile> createState() => _SeekerCompleteProfileState();
}

class _SeekerCompleteProfileState extends State<SeekerCompleteProfile> {
  int selectedStep = 1;
  // List<Widget> educationFormList = [
  //   const EducationDetailsForm(),
  // ];
  int countEducationFormList = 1;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: MyAppText(
          text: AppStrings.setUpProfile,
          fontSize: 18,
        ),
        actions: [
          MyAppText(
            text: AppStrings.skip,
            fontSize: 16,
            color: MyColors.purpleButtonColor,
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Consumer<ProfileController>(
          builder: (context, profileController, value) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              MyAppText(
                text: AppStrings.education,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: MyColors.blueColor,
                    child: MyAppText(
                      text: selectedStep.toString(),
                      color: Colors.white,
                    ),
                  ),
                  // SizedBox(
                  //   width: 300,
                  // ),
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: MyColors.blueColor,
                      // ignore: unnecessary_brace_in_string_interps
                      child: Text(
                        '${selectedStep + 1}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: countEducationFormList,
                  itemBuilder: (ctx, index) {
                    return EducationDetailsForm(
                      index: index,
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    countEducationFormList += 1;
                    // educationFormList
                    //     .add(const EducationDetailsForm(index: index));
                  });
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedStep + 1;
                        countEducationFormList += 1;
                      });
                    },
                    child: Text(
                      "Add More",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: MyColors.purpleButtonColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: CustomButton(
                    buttonText: "Save and Continue",
                    size: size,
                    isTransparentButton: false,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectIndustrytype(
                                authUserType: widget.authUserType)),
                      );
                      print('AuthType${widget.authUserType}');
                    },
                    width: UiUtils.longButtonWidth - 2),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class EducationDetailsForm extends StatefulWidget {
  final int index;
  const EducationDetailsForm({
    super.key,
    required this.index,
  });

  @override
  State<EducationDetailsForm> createState() => _EducationDetailsFormState();
}

class _EducationDetailsFormState extends State<EducationDetailsForm> {
  final Detail userEduction = Detail();
  final TextEditingController eduTextEditingController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileController>().addSeekerEducation(Detail());
  }

  @override
  Widget build(BuildContext context) {
    eduTextEditingController.addListener(() {
      userEduction.schoolName = eduTextEditingController.value.text;
    });
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.08,
        ),
        MyCommonDropDownButton(
          dataList: const ['Option 1', 'Option 2', 'Option 3'],
          onChanged: (v) {
            userEduction.board = v;
            context
                .read<ProfileController>()
                .editSeekerEducation(userEduction, widget.index);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        MyCommonTextField(
          hint: AppStrings.schoolName,
          textEditingController: eduTextEditingController,
        ),
        const SizedBox(
          height: 20,
        ),
        MyCommonDropDownButton(
          hintText: AppStrings.completed,
          dataList: const ['Option 1', 'Option 2', 'Option 3'],
          onChanged: (v) {
            // userEduction.certificate = v;
            // context
            //     .read<ProfileController>()
            //     .editSeekerEducation(userEduction, widget.index);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        DatePickerButton(
          selectedDate: (DateTime t) {
            userEduction.completionYear =
                "${t.toLocal()}".split(' ')[0].toString();
            context
                .read<ProfileController>()
                .editSeekerEducation(userEduction, widget.index);
            setState(() {});
          },
          title: userEduction.completionYear != null &&
                  userEduction.completionYear != ""
              ? userEduction.completionYear!
              : AppStrings.startingYear,
        ),
        const SizedBox(
          height: 20,
        ),
        DatePickerButton(
          title: userEduction.completionYear != null &&
                  userEduction.completionYear != ""
              ? userEduction.completionYear!
              : AppStrings.completionYear,
          selectedDate: (DateTime t) {
            setState(() {});
            // userEduction.completionYear = t.toLocal().toString();
            // context
            //     .read<ProfileController>()
            //     .editSeekerEducation(userEduction, widget.index);
          },
        ),
      ],
    );
  }
}
