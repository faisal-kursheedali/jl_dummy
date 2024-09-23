import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class Style {
// fontFamily = "";
  static double splashTitleFontSize = 35;
  static double titleFontSize = 18;
  static double labelFontSize = 15;
  static double jobTitleFontSize = 20;
  static double appBarTitleFontSize = 20;

  static TextStyle splashStyle = GoogleFonts.inter(
      fontSize: splashTitleFontSize,
      fontWeight: FontWeight.w700,
      color: MyColors.black);

  static TextStyle titleStyle = GoogleFonts.inter(
    fontSize: titleFontSize,
    fontWeight: FontWeight.w700,
    color: MyColors.black,
  );

  static TextStyle pagetitleStyle = GoogleFonts.inter(
    fontSize: titleFontSize,
    fontWeight: FontWeight.w700,
    color: const Color(0xff101623),
  );

  static TextStyle buttontitleStyle = GoogleFonts.inter(
    fontSize: titleFontSize,
    fontWeight: FontWeight.w400,
    color: const Color(0xff101623),
  );
  static TextStyle labelStyle = GoogleFonts.inter(
    fontSize: labelFontSize,
    fontWeight: FontWeight.w500,
    color: const Color(0xff8B5CF6),
  );
  static TextStyle tabslabelStyle = GoogleFonts.inter(
    fontSize: labelFontSize,
    fontWeight: FontWeight.w600,
    color: MyColors.black,
  );

  static TextStyle jobTitleStyle = GoogleFonts.inter(
    fontSize: jobTitleFontSize,
    fontWeight: FontWeight.w700,
    color: MyColors.black,
  );

  static TextStyle appBarTitleStyle = GoogleFonts.inter(
      fontSize: appBarTitleFontSize,
      fontWeight: FontWeight.w600,
      color: const Color(0xff1E293B));
}

class AppStrings {
  static String contact = 'Contact';
  static String splashTitle = "Title";
  static String applicationTitle = "Application";
  static String accountPrivacyTxt = 'Account Privacy';
  static String saveBtn = 'Save';
  static String continueBtn = 'Continue';

  static String showAccountDetailsTxt = 'Show Account\nDetails';
  static String onlyToTxt = 'Only to';
  static String accountTxt = 'Account';
  static String accountAndFinancingTxt = 'Account& financing';
  static String profileInfoTxt = 'Profile Info';
  static String hintTxt = 'Darin';
  static String emailAddHintTxt = 'Email address';
  static String mobileNumberHintTxt = 'Mobile Number';
  static String dateOfBirthHintTxt = 'Date of Birth';
  static String genderHintTxt = 'Gender';
  static String addressTxt = 'Address';
  static String pincodeHintTxt = 'Pincode';
  static String landMarkLocalityHintTxt = 'Landmark, Locality';
  static String flatNumAndStreetNameHintTxt = 'Flat No.  Street Name';
  static String accountInfoTxt = 'Account Info';
  static String profileSetupTxt = 'Profile Set-up';
  static String mentionCompanyTxt =
      'Mention your  Company - Contact, Project work and certification';
  static String generalPrefTxt = 'General Preference';
  static String appPrefThemesTxt = 'App preference, Common change, Themes';
  static String notificationManageTxt = 'Notification Manage';
  static String chooseNotificationPrefTxt =
      'Choose your Notification Preference';
  static String dataPrivacyProtTxt = 'Data Privacy & Protection';
  static String dataPrivacyEnableDisableTxt =
      'Data Privacy & Protection Enable /  Disable your Private Information to be displayed.';
  static String helpSupportTxt = 'Help & Support';
  static String customorChatSupportTxt =
      'Customer Support - 24*7 ,Chat support, Customer call representative';
  static String profileCompletionTxt = 'Profile Completion';
  static String detailRemainingTxt = '5 Detail reamianig';
  static String updatedDayTxt = 'Updated 3 day ago';
  static String dataPrivacyTxt = 'Data Privacy';
  static String companyDetailsTxt = 'Company Details';
  static String selectwhoSeeNumberTxt =
      'Select who can see your Hr Contact number , other';
  static String languageTxt = 'Language';
  static String englishTxt = 'English';
  static String candidateAlertTxt = ' New Candidate Alert';
  static String candidateAlertRecommandationTxt =
      'Candidate alerts, Candidate recommendation, Candidate application updates';
  static String newAndEventsTxt = 'News & Events';
  static String publishingNewTxt = 'Publishing News Articles, Other Events';
  static String companyNameTxt = 'Company Name';
  static String jobAertTxt = 'Job Alert';
  static String networkConnectionTxt = 'Network Connection';
  static String peopleRequestTxt = 'People Request';
  static String newConnectionReqTxt = 'When you have new connection request';
  static String groupInviteTxt = 'Group Invites';
  static String groupInviteJoinTxt =
      'When any group invites you to join to their page';
  static String peopleSuggetion = 'People Suggetion';
  static String applicationStatusTxt = 'Application Status';
  static String assetManagementAnalyst = 'Asset Management Analyst';
  static String consolidatedBankTxt = 'Consolidated Bank Ghana';
  static String circleAccraTxt = 'Circle, Accra';
  static String ghPerMonthTxt = 'GH 4,500 - GH 6,000 / month';
  static String partTimeTxt = 'Part-Time';
  static String onSiteTxt = 'On-Site';
  static String appliedEndDateTxt =
      'Applied July 27, 2024 | Ends Sept 27, 2024';
  static String yourAppStatusTxt = 'Your Application Status';
  static String applicationSentTxt = 'Application Sent';
  static String applicationAcceptedTxt = 'Application Accepted';
  static String applicationCanceled = 'Application Canceled';
  static String canceledApplicationTxt = "Cancel Application";
  static String viewCompanyDetailTxt = "View Company Details";
  static String welcomeBackTxt = 'Yeay! Welcome Back';
  static String onceAgainSuccessfullyLoginTxt =
      'Once again you login successfully into medidoc app';
  static String loginBtn = 'Login';
  static String success = 'Success';
  static String enterEmailHintTxt = 'Enter your email';
  static String enterPassHintTxt = 'Enter your password';
  static String enterNewPassHintTxt = 'Enter your new password';
  static String forgetPassHintTxt = 'Forgot Password?';
  static String dontHaveAccTxt = 'Don\'t have an account?  ';
  static String signUpBtn = 'Sign Up';
  static String forgotPassword = 'Forgot Password';
  static String loginAsSeekerBtn = "Login as Seeker";
  static String orTxt = "OR";
  static String loginAsProviderBtn = "Login as Provider";
  static String enterNameHintTxt = 'Enter your name';
  static String iAgreeTxt = 'I agree to the medidoc ';
  static String termsOfServiceTxt = 'Terms of Service';
  static String andTxt = ' and ';
  static String privacyPolicyTxt = 'Privacy Policy';
  static String alreadyHaveAccTxt = 'Already have an account?  ';
  static String signUpAsSeekerBtn = "Sign Up as Seeker";
  static String signUpAsProviderBtn = "Sign Up as Provider";
  static String letsGetStartTxt = "Let’s get started!";
  static String loginToEnjoyStayHealthyTxt =
      "Login to enjoy the features we’ve provided, and stay healthy!";
  static String selectLanguageTxt = 'Select Language';
  static String pleaseSelectTxt = 'Please Select';
  static String goToHomeTxt = 'Go to home';
  static String circularPercentageIndicatorTxt =
      'Circular Percentage Indicator';
  static String welcomeTxt = 'Hello, K 👋';
  static String nameTxt = 'Ariz Sheikh';
  static String descTxt = 'Lorem ipsum dolor sit amet consectetur.';
  static String uidesignerTxt = 'UI Designer';
  static String fieldTypeTxt = 'Field type 2';
  static String notification = "Notification";
  static String isRequestingAccessTo = "is requesting access to";
  static String chatYou = "Chat you!";
  static String accept = "Accept";
  static String decline = "Decline";
  static String newFeatureAlert = "New Feature Alert!";
  static String tryNow = "Try Now";
  static String hasSharedTheImageWithYou = "has shared the image with you";
  static String viewedYour = "viewed your";
  static String Serach = 'Search';
  static String noMatchFound = 'No Match Found';
  static String sorryNotFound =
      "Sorry,The Keyword you are looking for is not found.";
  static String pleaseTrydifferent = 'Please Try with different keyword';
  static const String filters = "filters";
  static const String reset = "Reset";
  static const String apply = "Apply";
  static const List<String> filterOptions = [
    "Job Type",
    "Experience",
    "Location",
    "Salary Amount",
    "Job Level",
    "Job Category",
  ];

  static const String jobType = "Job Type";
  static const String experience = "Experience";
  static const String location = "Location";
  static const String salaryAmount = "Salary Amount";
  static const String jobLevel = "Job Level";
  static const String jobCategory = "Job Category";

  static String uploadResume = 'Upload CV/Resume';
  static String motivationLetter = 'Motivation Letter (Optional)';
  static String motivationLetterT = 'Motivation Letter';
  static String fullName = 'Full Name';
  static String email = 'Email';

  static String applySuccessfull =
      'You have successfully applied for the job. You can track your application progress through the application menu.';
  static String visitApplication = 'Visit Applicaiton';
  static String applySuccess = 'Applied Successfully!';
  static String motivationText =
      'Lorem ipsum dolor sit amet consectetur. Scelerisque nisi amet volutpat lacus id id cras vitae at. Elementum facilisi in libero tincidunt morbi urna. Sit at malesuada ut posuere quis fermentum ultrices aliquam pharetra. Tellus consectetur aliquam adipiscing sed mattis. Porta leo adipiscing leo amet fermentum. Nunc lacus turpis tincidunt quis sem purus vitae. Pharetra feugiat elementum aliquet vel viverra turpis tincidunt. Ultrices viverra dolor dignissim scelerisque quisque. Eget ornare ultricies ut faucibus fermentum placerat massa amet. Vel imperdiet sapien pellentesque aliquam at in morbi turpis. Amet molestie cursus ultrices tellus eu ut. Elit donec sed mauris luctus mauris facilisi vitae aliquam parturient. Massa ultrices blandit ullamcorper malesuada. Turpis et.';
  static String userName = 'John Doe';
  static String userEmail = 'example@email.com';
  static String pdfName = 'Resume.pdf';
  static String pdfSize = '543 kb';
  static String applyButton = 'Apply';
  static String setUpProfile = 'Setup your Profile';
  static String education = 'Education';
  static String skip = 'Skip';
  static String selectBoard = 'Select Board / University ';
  static String schoolName = 'School Name ';
  static String completed = 'Completed';
  static String startingYear = 'Starting Year';
  static String completionYear = 'Completion Year';
  static String accountPrivacy = 'Account Privacy';
  static String next = 'Next';
  static String post = 'Post';
  static String postedSuccessfully = 'Posted Successfully!';
  static String postedSuccessfullySub =
      'You have successfully applied for the job.You can track your application progress through the application menu.';
  static String autoplayVideos = 'Autoplay Videos';
  static String showProfilePicture = 'Show Profile Picture';
  static String personalDetails = 'Personal Details';
  static String personalDetailsSub =
      'Select who can see your profile photo, name other';
  static String onlyToMyNetwork = 'Only to My Network';
}

class ErrorMessage {
  static String defaultErrorMessage = "Something went wrong";
}
