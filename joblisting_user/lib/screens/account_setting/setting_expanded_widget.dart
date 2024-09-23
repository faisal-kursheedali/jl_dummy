import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:joblisting_user/screens/account_setting/account_privacy.dart';
import 'package:joblisting_user/ui_utils/assets.dart';

class SettingExpndedCard extends StatefulWidget {
  final String text;
  final String subtext;

  const SettingExpndedCard(
      {super.key, required this.text, required this.subtext});

  @override
  _SettingExpndedCardState createState() => _SettingExpndedCardState();
}

class _SettingExpndedCardState extends State<SettingExpndedCard> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 13.0, bottom: 13, top: 13),
      child: GestureDetector(
        onTap: _toggleExpand,
        child: Stack(
          children: [
            Container(
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
                      widget.text,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: screenWidth * 0.2, top: screenWidth * 0.01),
                      child: Text(
                        widget.subtext,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    if (_isExpanded) PrivacyDetail(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: SvgPicture.asset(Assets.roundArrowIc),
            ),
          ],
        ),
      ),
    );
  }
}
