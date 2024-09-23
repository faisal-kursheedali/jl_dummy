import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'text': text,
        'isSent': true,
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
        var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
              backgroundColor: MyColors.white,
        title: const Text("Alex Marchal", style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600), ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
              ),
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert),
            color: Colors.white, // Overall box color
            onSelected: (int result) {
              switch (result) {
                case 0:
                  // Handle option 1
                  break;
                case 1:
                  // Handle option 2
                  break;
                case 2:
                  // Handle option 3
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 0,
                child: Center(
                  child: Container(
                     decoration: BoxDecoration(
                      color: MyColors.lightPurpleBgColor, 
                      borderRadius: BorderRadius.circular(8.0),
                     
                    ),
                    height: screenHeight*0.04,
                    width: screenWidth*0.3,
                    child: Center(child: Text('Block', style: TextStyle(
                      
                      fontSize: screenWidth*0.04,
                      color: MyColors.purpleButtonColor))),
                  ),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Center(
                  child: Container(
                     decoration: BoxDecoration(
                      color: MyColors.lightPurpleBgColor, 
                      borderRadius: BorderRadius.circular(8.0),
                     
                    ),
                    height: screenHeight*0.04,
                    width: screenWidth*0.3,
                    child: Center(child: Text('Report', style: TextStyle(
                      
                      fontSize: screenWidth*0.04,
                      color: MyColors.purpleButtonColor))),
                  ),
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child:Center(
                  child: Container(
                     decoration: BoxDecoration(
                      color: MyColors.lightPurpleBgColor, 
                      borderRadius: BorderRadius.circular(8.0),
                
                    ),
                    height: screenHeight*0.04,
                    width: screenWidth*0.3,
                    child: Center(child: Text('Remove', style: TextStyle(
                      
                      fontSize: screenWidth*0.04,
                      color: MyColors.purpleButtonColor))),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: message['isSent']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: message['isSent']
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: message['isSent']
                                ? MyColors.lightPurpleBgColor
                                : MyColors.purpleButtonColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message['text'],
                            style: const TextStyle(
                              color:
                                  // message['isSent'] 
                                   Colors.black,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 14.0),
                          child: Text(
                            '3:20 PM',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      fillColor: Colors.grey.shade200,
                      suffixIcon:  IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
