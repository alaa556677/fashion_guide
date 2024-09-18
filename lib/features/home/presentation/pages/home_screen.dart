import 'package:fashion_guide/features/home/presentation/pages/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/search_text_form_field.dart';
import '../../../../core/widgets/text_default.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import 'products_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late TabController _tabController;
  late HomeCubit homeCubit;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      HomeCubit.instance.changeTabBarIndex(_tabController.index);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    homeCubit = HomeCubit.instance;
    homeCubit.changeTabBarIndex(0);
    homeCubit.initDummy();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Image.asset(AppImagesPath.appLogoOnly, width: 60.w, height: 80.h,),
                // SvgPicture.asset(AppImagesPath.profileImage),
                SizedBox(width: 8.w,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Welcome',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontColor: AppColors.textColor100,
                          ),
                          SizedBox(height: 4.h,),
                          TextWidget(
                            text: 'Nour Mohamed',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            fontColor: AppColors.textColor100,
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppIconsPath.notificationIcon),
                          SizedBox(width: 8.w,),
                          SvgPicture.asset(AppIconsPath.menuIcons),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 22.h,),
            SearchTextForm(searchController: searchController,),
            SizedBox(height: 18.h,),
            TabBarViewBaseScreenWidget(tabController: _tabController,),
            SizedBox(height: 16.h,),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children:  [
                  ProductsHomeScreen(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 22.h,),
                        SvgPicture.asset(
                          'assets/images/add_product.svg',
                          height: MediaQuery.of(context).size.height * 0.2,

                        ),
                        SizedBox(height: 22.h,),
                        ButtonCustomWidget(
                          text: 'Add Product',
                          color: AppColors.whiteColor,
                          onPressed: (){},
                          buttonHeight: 48.h,
                          buttonColor: AppColors.tabTextSelected ,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    ],
                  ),
                ],
              ),
            ),

          ],
        );
      },
    );
  }
}