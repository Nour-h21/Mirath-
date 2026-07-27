import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/app/di/injection_container.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/features/home/presentation/bloc/home_event.dart';
import 'package:mirath/features/home/presentation/page/home_page.dart';

import '../../../../core/design/tokens/colors.dart';
import '../bloc/home_bloc.dart';

class NavicationBar extends StatefulWidget {
  const NavicationBar({super.key});

  @override
  State<NavicationBar> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavicationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(GetHomeEvent()),
      child: HomePage(),
    ),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: _pages[_selectedIndex],
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: FloatingActionButton(
      //   mini: true,
      //   onPressed: () {
      //     setState(() {
      //       _selectedIndex = 1;
      //     });
      //   },
      //   backgroundColor: AppColors.primaryColor,
      //   foregroundColor: AppColors.offWhite,
      //   splashColor: AppColors.primaryColor,
      //   elevation: 8,
      //   shape: CircleBorder(),
      //   child: Icon(Icons.add, size: context.h(3)),
      // ),
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          _buildNavItem(icon: Icons.home_rounded, index: 0),
          _buildNavItem(icon: Icons.bookmark_rounded, index: 2),
          _buildNavItem(icon: Icons.add, index: 3),
          _buildNavItem(icon: Icons.video_chat, index: 4),
          _buildNavItem(icon: Icons.person_rounded, index: 5),
        ],
        inactiveIcons: [
          _buildNavItem(icon: Icons.home_rounded, index: 0),
          _buildNavItem(icon: Icons.bookmark_rounded, index: 2),
          _buildNavItem(icon: Icons.add, index: 3),
          _buildNavItem(icon: Icons.contact_phone_rounded, index: 4),
          _buildNavItem(icon: Icons.person_rounded, index: 5),
        ],
        color: AppColors.grey,
        circleColor: AppColors.primaryColor,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.baieg, AppColors.grey, AppColors.grey],
        ),
        circleGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryColor, AppColors.primaryColor],
        ),
        height: context.h(5.6),
        circleWidth: context.h(5.5),
        padding: EdgeInsets.only(
          left: context.h(1.6),
          right: context.h(1.6),
          bottom: context.h(2.6),
        ),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: AppColors.offWhite,
        circleShadowColor: AppColors.black,
        elevation: 3.5,
        activeIndex: 2,
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    final isSelected = _selectedIndex == index;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryColor : Colors.white,
              size: context.h(2.7),
            ),
          ],
        ),
      ),
    );
  }
}
