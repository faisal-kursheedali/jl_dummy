
import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/colors.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return  Center(child:Transform.scale(
            scale: 0.9,
        child: 
        Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
        isSwitched = value;
                });
              },
              activeTrackColor: MyColors.purpleButtonColor,
              activeColor: MyColors.white,
              inactiveTrackColor: Colors.white,
              inactiveThumbColor: MyColors.purpleButtonColor,
        )    ));
        
    
  }
}