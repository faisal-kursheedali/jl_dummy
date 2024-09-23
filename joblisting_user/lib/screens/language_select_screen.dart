// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/strings.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  final List<String> languages = [
   "Accounting", "Coommerce","React","Hospital","farmer","tech"
  ];

  @override
  Widget build(BuildContext context) {
     var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
           backgroundColor: MyColors.white,
     appBar: AppBar(
        backgroundColor: MyColors.white,
        title: Center(child: Text(AppStrings.selectLanguageTxt, style: const TextStyle(fontWeight: FontWeight.w800),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(
                top:  screenHeight*0.02,
                left: screenWidth*0.06,
                bottom: screenHeight*0.02
              ),
              child: Text(
                         AppStrings.pleaseSelectTxt,
                         style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w800),
                       ),
            ),
          
            SizedBox(
              height: screenHeight*0.82,
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal:12,
                      vertical: 7),
                    child: Column(
                      children: [
                   if (index == 0) 
                     Padding(
                       padding:  EdgeInsets.only(bottom: screenHeight*0.02),
                       child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, ), 
                          child: const Divider(
                            
                                  height: 0.2,
                                  color: Colors.grey,
                             
                              ),
                        ),
                     ),
                        ListTile(
                          title: Text(
                            
                            languages[index],
                            style: TextStyle(
                            fontWeight: FontWeight.w800,
                              color: selectedLanguage == languages[index] ? MyColors.purpleButtonColor : const Color.fromARGB(255, 91, 91, 91),
                            ),
                          ),
                          trailing: selectedLanguage == languages[index]
                            ? Icon(Icons.check, color: MyColors.purpleButtonColor)
                            : null,
                        onTap: () {
                          setState(() {
                            selectedLanguage = languages[index];
                          });
                        },),
                        if (index < languages.length - 1)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0), 
                        child: const Divider(
                          
                                height: 0.2,
                                color: Colors.grey,
                           
                            ),
                      ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}