import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/screen_default.dart';
import '../../../home/presentation/pages/home_screen.dart';

class BaseScreen extends StatefulWidget{
  const BaseScreen({super.key});
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentNumber = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      sizeAppbar: Size.zero,
      backgroundColor: AppColors.whiteColor,
      topPadding: 30.h,
      body: screens[currentNumber],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index){
          setState(() {
            currentNumber = index;
          });
        },
        buttonBackgroundColor: AppColors.buttonColorAll,
        backgroundColor: AppColors.buttonColorCategory,
        iconPadding: 12,
        animationCurve: Curves.linear,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIconsPath.homeIcon, color: currentNumber == 0 ? AppColors.whiteColor : AppColors.blackColor),
            label: 'Home',
            labelStyle: TextStyle(
              color: AppColors.labelColor,
              fontSize: 14.sp,
              fontWeight: AppFontWeight.medium
            )
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIconsPath.chatIcon, color: currentNumber == 1 ? AppColors.whiteColor : AppColors.blackColor),
            label: 'Chats',
              labelStyle: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.medium
              )
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIconsPath.cartIcon, color: currentNumber == 2 ? AppColors.whiteColor : AppColors.blackColor),
            label: 'Cart',
              labelStyle: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.medium
              )
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIconsPath.profileIcon, color: currentNumber == 3 ? AppColors.whiteColor : AppColors.blackColor),
            label: 'Profile',
              labelStyle: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.medium
              )
          ),
        ],
      ),
    );
  }
}

List <Widget> screens = [
  const HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
];