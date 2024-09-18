import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../../../../core/widgets/screen_default.dart';
import '../../../../core/widgets/text_default.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_states.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return DefaultScreen(
          backgroundColor: AppColors.whiteColor,
          // topPadding: 20.h,
          sizeAppbar: Size(double.infinity, 72.h),
          titleWidget: TextWidget(
            text: 'Products',
            fontColor: AppColors.brush,
            fontSize: 16.sp,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.chevron_right_outlined, size: 32.r,),
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Add Product',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greyColor,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Center(
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/add_image.PNG'),
                                    SizedBox(height: 20.h,),
                                    TextWidget(
                                      text: 'Add Image',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h,),
                        TextWidget(
                          text: 'Name',
                        ),
                        SizedBox(height: 12.h,),
                        DefaultTextFormField(
                          hintText: 'Name',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 44,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return "required Field";
                            }
                          },
                        ),
                        SizedBox(height: 12.h,),
                        TextWidget(
                          text: 'Price',
                        ),
                        SizedBox(height: 12.h,),
                        DefaultTextFormField(
                          hintText: 'Price',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 44,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return "required Field";
                            }
                          },
                        ),
                        SizedBox(height: 12.h,),
                        TextWidget(
                          text: 'Category Id',
                        ),
                        SizedBox(height: 12.h,),
                        DefaultTextFormField(
                          hintText: 'Category Id',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 44,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return "required Field";
                            }
                          },
                        ),
                        SizedBox(height: 12.h,),
                        TextWidget(
                          text: 'Description',
                        ),
                        SizedBox(height: 12.h,),
                        DefaultTextFormField(
                          hintText: 'Description',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 72,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return "required Field";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 22.h,),
                ButtonCustomWidget(
                  text: 'Add Product',
                  buttonColor: AppColors.tabTextSelected,
                  color: Colors.white,
                  buttonHeight: 42.h,
                  onPressed: (){
                    if (formKey.currentState!.validate()) {
                      ProductsCubit.instance.addProduct(
                        name: nameController.text,
                        price: double.parse(priceController.text),
                        description: descriptionController.text,
                        discount: double.parse(discountController.text),
                        categoryId: nameController.text,
                        image: ProductsCubit.instance.filePath == null
                            ? File("")
                            : ProductsCubit.instance.filePath!,
                        isImageExist: ProductsCubit.instance.filePath == null ? false : true,
                        imageByte:  ProductsCubit.instance.filePath == null ? Uint8List(10) : ProductsCubit.instance.imageByte,
                      );

                    }
                  },
                ),
                SizedBox(height: 22.h,),

              ],
            ),
          ),
        );
      },
    );
  }
}
