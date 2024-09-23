
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joblisting_user/ui_utils/assets.dart';

Widget settingCard(BuildContext context, String text, String subtext) {
    var screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(left:13.0,bottom: 13,top: 13),
    child: Stack(
      children: [Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
                 
              Padding(
                padding:  EdgeInsets.only(
                  right: screenWidth*0.2,
                  top: screenWidth*0.01),
                child: Text(
                  subtext,
                   softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
   Positioned(
    top:20,
    right: 20,
    child:SvgPicture.asset(Assets.roundArrowIc))
   ] ),
  );
}