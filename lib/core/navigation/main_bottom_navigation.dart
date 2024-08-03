import 'package:dating_app/core/constants/app_icons.dart';
import 'package:dating_app/features/chat/presentation/pages/chat_list.dart';
import 'package:flutter/material.dart';

class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({super.key});

  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  final PageController _pageController = PageController();

  void _onTap(int index) {

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ChatListPage(),
          ChatListPage(),
          ChatListPage(),
          ChatListPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _onTap(index);
        },
        iconSize: 24,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff191818),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.first_bottom_icon
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.chat_icon
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.heart_icon
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AppIcons.settings_icon,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
