import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/text_default.dart';

class TabBarViewBaseScreenWidget extends StatefulWidget {
  final TabController tabController;
  const TabBarViewBaseScreenWidget({super.key, required this.tabController});

  @override
  State<TabBarViewBaseScreenWidget> createState() => _TabBarViewBaseScreenWidgetState();
}

class _TabBarViewBaseScreenWidgetState extends State<TabBarViewBaseScreenWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border (bottom: BorderSide(color: AppColors.tabBottomColor)),
      ),
      child: TabBar(
        controller: widget.tabController,
        indicatorColor: Colors.transparent,
        indicatorPadding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.symmetric(horizontal: 0.w),
        unselectedLabelStyle: TextStyle(
            fontSize: 16.sp,
            color: AppColors.tabTextUnSelected,
            fontWeight: FontWeight.w300,
        ),
        labelStyle: TextStyle(
            fontSize: 16.sp,
            color: AppColors.tabTextSelected,
            fontWeight: FontWeight.w700
        ),
        indicator: BoxDecoration(border: Border(bottom: BorderSide(width: 3.w, color: AppColors.tabTextSelected))),
        tabs: const [
          Tab(
            child: TextWidget(
              text: 'Products',
            ),
          ),
          Tab(
            child: TextWidget(
              text: 'Companys',
            ),
          ),
          Tab(
            child: TextWidget(
              text: 'Suppliers',
            ),
          ),
        ],
      ),
    );
  }
}
