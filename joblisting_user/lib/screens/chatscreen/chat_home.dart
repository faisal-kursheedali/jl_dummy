// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:joblisting_user/screens/chatscreen/chatscreen.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: const Center(
          child: Text(
            'Message',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: ListView(
        children: [
          const CustomChatView(
            imageUrl: 'assets/image1.jpg',
            name: 'Alex Marchal',
            message: 'I have some questions about...',
          ),
          const CustomChatView(
            imageUrl: 'assets/image2.jpg',
            name: 'Norma Wilson',
            message: 'http://www.warephase.com',
          ),
          const CustomChatView(
            imageUrl: 'assets/image3.jpg',
            name: 'Alex Marchal',
            message: 'I have some questions about...',
          ),
          const CustomChatView(
            imageUrl: 'assets/image4.jpg',
            name: 'Norma Wilson',
            message: 'http://www.warephase.com',
          ),
        ],
      ),
    );
  }
}

class CustomChatView extends StatelessWidget {
  const CustomChatView({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.message,
  });

  final String imageUrl;
  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imageUrl),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
