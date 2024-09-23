import 'package:flutter/material.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/controller/authController.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/features/Profile/controller/profile_controller.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/screens/complete_profile/provider_complete_profile.dart';
import 'package:joblisting_user/screens/complete_profile/seeker_personal_info.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/ui_utils.dart';
import 'package:joblisting_user/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CountrySelectionScreen extends StatefulWidget {
  final AuthUserType? authUserType;
  final bool isFromAuth;
  const CountrySelectionScreen(
      {super.key, this.authUserType, required this.isFromAuth});

  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String? selectedCountry;
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> countries = [
    {'name': 'India', 'flag': 'assets/images/india.jpeg'},
    {'name': 'Iraq', 'flag': 'assets/images/india.jpeg'},
    {'name': 'Amerio', 'flag': 'assets/images/india.jpeg'},
    {'name': 'italy', 'flag': 'assets/images/india.jpeg'},
    {'name': 'Spain', 'flag': 'assets/images/india.jpeg'},
    {'name': 'France', 'flag': 'assets/images/india.jpeg'},
    {'name': 'bamila', 'flag': 'assets/images/india.jpeg'},
    {'name': 'SriLanka', 'flag': 'assets/images/india.jpeg'},
    {'name': 'pakistan', 'flag': 'assets/images/india.jpeg'},
    {'name': 'nepal', 'flag': 'assets/images/india.jpeg'},
    {'name': 'bhutan', 'flag': 'assets/images/india.jpeg'},
    {'name': 'America', 'flag': 'assets/images/india.jpeg'},
  ];

  List<Map<String, String>> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
    searchController.addListener(_filterCountries);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterCountries);
    context.read<ProfileController>().setIsFromAuth(widget.isFromAuth);
    searchController.dispose();
    super.dispose();
  }

  void _filterCountries() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredCountries = countries
          .where((country) => country['name']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: const Center(
          child: Text(
            'Select Your Country',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: Consumer<ProfileController>(
          builder: (context, profileController, value) {
        if (profileController.countryName != null) {
          selectedCountry = profileController.countryName;
        }
        return Column(
          children: [
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
              child: Center(
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Image.asset('assets/images/search_ic.png'),
                    ),
                    hintStyle: const TextStyle(color: Colors.grey),
                    hintText: 'Search',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  String countryName = filteredCountries[index]['name']!;
                  String countryFlag = filteredCountries[index]['flag']!;

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
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
                        child: ListTile(
                          leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(countryFlag),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            countryName,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Radio<String>(
                            value: countryName,
                            groupValue: selectedCountry,
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                            activeColor: MyColors.purpleButtonColor,
                          ),
                          onTap: () {
                            context
                                .read<ProfileController>()
                                .setCountryName(countryName);
                            setState(() {
                              selectedCountry = countryName;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: CustomButton(
                buttonText: "Continue",
                ontap: () {
                  print("hello");
                  print(widget.authUserType);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // widget.authUserType == AuthUserType.provider
                            PrefUtil.getString(LocalConfig.isProvider) ==
                                    'provider'
                                // PrefUtil.getBool(LocalConfig.isProvider)
                                ? ProviderCompleteProfile(
                                    authUserType: widget.authUserType,
                                  )
                                : SeekerProfileInfo(
                                    authUserType: widget.authUserType,
                                  )),
                  );
                },
                width: UiUtils.longButtonWidth - 2,
                size: MediaQuery.sizeOf(context),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      }),
    );
  }
}
