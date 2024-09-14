import 'package:fashion_guide/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/text_default.dart';
import '../../../../core/widgets/text_form_field_default.dart';
import '../cubit/auth_cubit.dart';
import 'package:fashion_guide/locator.dart' as di;

import '../widgets/top_circle.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => di.locator<AuthCubit>(),
        child: BlocConsumer<AuthCubit , AuthStates>(
          listener: (context, state) {
            if(state is LoginSuccessState ){
              print('succccccccccccccccccc');
            }else if (state is LoginErrorState){
              print('ffffffffffffffffffff');
            }
          },
          builder:  (context, state) {
            return Form(
              key: formKey,
              child: Column(
                children: [
                  TopCircle(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Sign In',
                            fontColor: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 34.sp,
                          ),
                          SizedBox(height: 8.h,),
                          TextWidget(
                            text: 'Hey! Good to see you again',
                            fontColor: AppColors.greyColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),

                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 30.w,
                          height: 18.h,
                          child: Transform.scale(
                            scale: 8.r,
                            child: SvgPicture.asset('assets/images/bottom_login_circle.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                      Column(
                        children: [
                          ChatTextFormField(
                            hintText: 'email',
                            controller: emailController,
                          ),
                          SizedBox(height: 20,),
                          ChatTextFormField(
                            hintText: 'password',
                            controller: passwordController,
                          ),
                          SizedBox(height: 20,),
                          ButtonCustomWidget(
                            text: 'Login',
                            buttonHeight: 65,
                            color: AppColors.tabTextSelected,
                            buttonColor: Colors.white,
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                AuthCubit.instance.login(email: emailController.text, password: passwordController.text);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

