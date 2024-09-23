import 'package:flutter/material.dart';
import 'package:joblisting_user/BottomnavBar/bottomNav.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/main.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/screens/complete_profile/complete_profile_seeker.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SeekerProfileInfo extends StatefulWidget {
  final AuthUserType? authUserType;
  const SeekerProfileInfo({super.key, this.authUserType});

  @override
  _SeekerProfileInfoState createState() => _SeekerProfileInfoState();
}

class _SeekerProfileInfoState extends State<SeekerProfileInfo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String selectedGender = 'male';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        birthDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
      context.read<ProfileController>().setSeekerDob(picked.toLocal());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileController>().setProfilePageTextController();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ProfileController>(
        builder: (context, profileController, value) {
      return Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          backgroundColor: MyColors.white,
          title: const Center(
            child: Text(
              'Personal Details',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
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
                    child: Center(
                      child: TextFormField(
                        controller:
                            profileController.seekerFullNameTextController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      //border: Border.all(color: Colors.g)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: profileController.seekerPhoneTextController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                            return 'Please enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: MyColors.lightPurpleButtonColor,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Image.asset('assets/images/calendar.png'),
                          ),
                          const SizedBox(width: 40),
                          profileController.seekerDob != null
                              ? Text(
                                  "${profileController.seekerDob!.toLocal()}"
                                      .split(' ')[0],
                                  style: TextStyle(
                                    color: MyColors.purpleButtonColor,
                                    fontWeight: FontWeight.bold,
                                  ))
                              : Text(
                                  'Choose your Birth',
                                  style: TextStyle(
                                    color: MyColors.purpleButtonColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              profileController.setSeekerGender('male');
                              // setState(() {
                              //   profileController.seekerGender = 'male';
                              // });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: profileController.seekerGender == 'male'
                                    ? MyColors.purpleButtonColor
                                    : Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                    color:
                                        profileController.seekerGender == 'male'
                                            ? Colors.white
                                            : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              profileController.setSeekerGender('female');
                              // setState(() {
                              //   profileController.seekerGender = 'female';
                              // });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    profileController.seekerGender == 'female'
                                        ? MyColors.lightPurpleButtonColor
                                        : Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                    color: profileController.seekerGender ==
                                            'female'
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.35),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: CustomButton(
                      buttonText: 'Save & Continue',
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          // Save the form data
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Form Submitted')),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeekerCompleteProfile(
                                    authUserType: widget.authUserType)),
                          );
                        }
                      },
                      width: UiUtils.longButtonWidth - 2,
                      size: MediaQuery.sizeOf(context),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        // Provider.of<ProfileController>(context, listen: false)
                        //     .setAuthType(AuthUserType.seeker);
                        PrefUtil.setString(LocalConfig.isProvider, 'seeker');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavBar(
                                    authUserType: AuthUserType.seeker,
                                  )),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
