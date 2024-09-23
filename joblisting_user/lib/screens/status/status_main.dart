
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:joblisting_user/ui_utils/custom_container.dart';
import 'package:joblisting_user/widgets/customTextField2.dart';


class StatusMainScreen extends StatefulWidget {
  const StatusMainScreen({super.key});

  @override
  State<StatusMainScreen> createState() => _StatusMainScreenState();
}

class _StatusMainScreenState extends State<StatusMainScreen> {
  int selectedIndex = 0;

  late FocusNode myFocusNode;

  List<Map<String, dynamic>> userData = [
    {
      'name': "Company Name",
      'message': 'I have some questions about...',
      'type': 'sent',
      'unread': 0,
      'textStatus': 'Application Sent',
      'image': 'https://picsum.photos/250?image=9'
    },
    {
      'name': "Norm Wilson",
      'message': 'http://www.warephase.com',
      'type': 'received',
      'unread': 0,
      'textStatus': 'Application Pending',
      'image': 'https://picsum.photos/250?image=10',
    },
    {
      'name': "Alex Marchal",
      'message': 'I have some questions about...',
      'type': 'sent',
      'unread': 0,
      'textStatus': 'Application Accepted',
      'image': 'https://picsum.photos/250?image=11'
    },
    {
      'name': "Norma Wilson",
      'message': 'http://www.warephase.com',
      'type': 'received',
      'unread': 0,
      'textStatus': 'Application Rejected',
      'image': 'https://picsum.photos/250?image=12'
    },
  ];

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = EdgeInsets.symmetric(horizontal: screenWidth * 0.05);

    return Scaffold(
      backgroundColor: MyColors.white,
     appBar: AppBar(
        backgroundColor: MyColors.white,
        title: const Center(
          child: Text(
            'Status',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: buildMessageTile(context, userData[index]),
          );
        },
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = EdgeInsets.symmetric(horizontal: screenWidth * 0.05);

    return Padding(
      padding: padding,
      child: SizedBox(
        height: 48,
        child: CustomTextField2(
          labelText: 'Serach',
          focusNode: myFocusNode,
          autoFocus: true,
          hintTextStyle: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.w400),
          labelStyle: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.black.withOpacity(0.4),
              fontWeight: FontWeight.w400),
          onTap: () {},
          onChanged: (value) {},
          borderColor: Colors.grey, //Constants.grey3,
          fillColor: MyColors.white,
          isFilled: true,
          borderRadius: 15,
          borderWidth: 1.0,
          focusedBorderWidth: 0.0,
          hintText: 'Search',
          margin: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          keyboardType: TextInputType.text,
          isLabelEnabled: false,
          overrideHintText: true,
          elevation: 0,
          focusedBorderColor: Colors.grey,
          trailingFunction: () {},
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 15),
              InkWell(
                onTap: () {
                  // Navigator.pop(context);
                },
                child: Image.asset(
                  '',
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          showTrailingWidget: false,
          // trailing:  Container(),
          textStyle: GoogleFonts.workSans(
              fontSize: 14, color: MyColors.black, fontWeight: FontWeight.w500),
          showLeadingWidget: true,
        ),
      ),
    );
  }

  Widget buildMessageTile(BuildContext context, Map userData) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth * 0.14;
    final textWidth = screenWidth * 0.6;

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const ChatScreen()),
        // );
      },
      child: Container(
        color: MyColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomContainer(
                height: imageSize,
                width: imageSize,
                borderRadius: 50,
                backgroundColor: MyColors.containerBackground1,
                padding: 0,
                margin: EdgeInsets.zero,
                child: Image.network(userData['image']),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData['name'],
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: (userData['type'] == 'sent') ? 'You: ' : '',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: MyColors.black.withOpacity(0.4),
                            ),
                          ),
                          TextSpan(
                            text: userData['message'],
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.011,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                          vertical: MediaQuery.of(context).size.height * 0.010),
                      decoration: BoxDecoration(
                          color: const Color(0xff8B5CF6).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        userData['textStatus'],
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 5),
                  if (userData['unread'] != 0)
                    CustomContainer(
                      height: 21,
                      width: 21,
                      backgroundColor: MyColors.red,
                      borderRadius: 50,
                      margin: EdgeInsets.zero,
                      padding: 0,
                      paddingEdge: EdgeInsets.zero,
                      child: Center(
                        child: Text(
                          "1",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: MyColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const ChatScreen()),
                  // );
                },
                iconSize: 24,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}