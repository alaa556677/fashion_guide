import 'package:fashion_guide/features/auth/presentation/cubit/auth_states.dart';
import 'package:fashion_guide/features/base_screen/presentation/pages/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../../../../core/widgets/password_text_field.dart';
import '../../../../core/widgets/richText_default.dart';
import '../../../../core/widgets/search_text_form_field.dart';
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
    AuthCubit.instance.clearErrorMessage();

    return Scaffold(
      body: BlocConsumer<AuthCubit , AuthStates>(
        listener: (context, state) {
          if(state is LoginSuccessState ){
            navigateToAndRemoveNamed(route:Routes.baseScreen);
          }
        },
        builder:  (context, state) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopCircle(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    Flexible(
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.008,),
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
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: double.infinity,
                            child: Image.asset('assets/images/login_bottom.PNG',fit: BoxFit.fill,)),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SizedBox(height: 40.h,),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         SizedBox(
                      //           width: MediaQuery.of(context).size.width,
                      //           height: MediaQuery.of(context).size.height * 0.11,
                      //           child: Transform.scale(
                      //             scale: 7.r,
                      //             child: SvgPicture.asset('assets/images/bottom_login_circle.svg'),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                          ),
                              DefaultTextFormField(
                                hintText: 'email',
                                controller: emailController,
                                borderRadius: 8,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "required Field";
                                  }
                                },
                                filledColor: Colors.white,
                                prefix: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                                  child: SvgPicture.asset(AppIconsPath.emailIcon, height: 14.h, width: 18.w,),
                                ),
                                onChanged: (_){
                                  AuthCubit.instance.clearErrorMessage();
                                },
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                              PasswordTextFormField(
                                hintText: 'Password',
                                controller: passwordController,
                                filledColor: Colors.white,
                                borderRadius: 8,
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "required Field";
                                  }
                                },
                                prefix: Padding(
                                  padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                                  child: SvgPicture.asset(AppIconsPath.passwordIcon, height: 18.h, width: 18.w,),
                                ),
                                onChanged: (_){
                                  AuthCubit.instance.clearErrorMessage();
                                },
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height * 0.016,),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextWidget(
                                  text: 'Forget Password?',
                                  fontColor: AppColors.whiteColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.025,),

                              TextWidget(
                                  text: AuthCubit.instance.errorMessage ??'',
                                  fontColor:Colors.red,
                                  fontSize: 16.sp
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
                              ButtonCustomWidget(
                                text: 'Sign In',
                                buttonHeight: 40.h,
                                color: AppColors.tabTextSelected,
                                buttonColor: Colors.white,
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    AuthCubit.instance.clearErrorMessage();
                                    AuthCubit.instance.login(email: emailController.text, password: passwordController.text);
                                  }
                                },
                                loadingWidget: state is LoginLoadingState
                                    ? CircularProgressIndicator(color: AppColors.tabTextSelected,strokeWidth: 2,) : null,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height * 0.045,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                      text: 'Don\'t have an account? ',
                                      fontColor:Colors.white,
                                      fontSize: 16.sp
                                  ),
                                  GestureDetector(
                                    onTap: () => navigateToNamed(route:Routes.register),
                                    child: TextWidget(
                                        text: 'Sign Up',
                                        fontColor: AppColors.tabTextSelected,
                                        fontSize: 16.sp
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

