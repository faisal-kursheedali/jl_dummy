import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:joblisting_user/app_config/config.dart';
import 'package:joblisting_user/features/Auth/models/auth_model.dart';
import 'package:joblisting_user/remote/localConfig.dart';
import 'package:joblisting_user/screens/account_setting/account_setting_screen.dart';
import 'package:joblisting_user/screens/applications/applications_screen.dart';
import 'package:joblisting_user/screens/chatscreen/chat_home.dart';
import 'package:joblisting_user/screens/home/provider_home_screen.dart';
import 'package:joblisting_user/screens/home/seeker_home_screen.dart';
import 'package:joblisting_user/screens/status/status_main.dart';
import 'package:joblisting_user/ui_utils/assets.dart';
import 'package:joblisting_user/ui_utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final AuthUserType? authUserType;
  const BottomNavBar({super.key, this.authUserType});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Color mainColor = const Color(0xFF2631C1);
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _selectedIndexNotifier.value = _controller.index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _selectedIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      // widget.authUserType == AuthUserType.provider
      // PrefUtil.getBool(LocalConfig.isProvider)
      PrefUtil.getString(LocalConfig.isProvider) == 'provider'
          ? const ProviderHomeScreen()
          : const SeekerHomePage(),
      const ChatHome(),
      // widget.authUserType == AuthUserType.provider
      // PrefUtil.getBool(LocalConfig.isProvider)
      PrefUtil.getString(LocalConfig.isProvider) == 'provider'
          ? const ApplicationsScreen()
          : const StatusMainScreen(),
      const AccountSettingScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: CustomIcon(
            assetName: Assets.bottomNavHome,
            selectedIndexNotifier: _selectedIndexNotifier,
            index: 0),
        title: ("Home"),
        activeColorPrimary: MyColors.purpleButtonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: CustomIcon(
            assetName: Assets.bottomNavChat,
            selectedIndexNotifier: _selectedIndexNotifier,
            index: 1),
        title: ("Message"),
        activeColorPrimary: MyColors.purpleButtonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: CustomIcon(
            assetName: Assets.bottomnavStatus,
            selectedIndexNotifier: _selectedIndexNotifier,
            index: 2),
        title: ("Status"),
        activeColorPrimary: MyColors.purpleButtonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: CustomIcon(
            assetName: Assets.bottomNavAccount,
            selectedIndexNotifier: _selectedIndexNotifier,
            index: 3),
        title: ("Account"),
        activeColorPrimary: MyColors.purpleButtonColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

class CustomIcon extends StatelessWidget {
  final String assetName;
  final ValueNotifier<int> selectedIndexNotifier;
  final int index;

  const CustomIcon(
      {required this.assetName,
      required this.selectedIndexNotifier,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndexNotifier,
      builder: (context, selectedIndex, child) {
        bool isActive = selectedIndex == index;
        return SvgPicture.asset(
          assetName,
          color: isActive
              ? MyColors.purpleButtonColor
              : CupertinoColors.systemGrey,
        );
      },
    );
  }
}
