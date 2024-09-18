import 'dart:io';

import 'package:fashion_guide/features/products/presentation/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../../domain/use_cases/add_product_use_case.dart';

class ProductsCubit extends Cubit <ProductsStates>{
  ProductsCubit(this.addProductUseCase) : super(InitialProductsState());
  static final ProductsCubit _productsCubit = BlocProvider.of<ProductsCubit>(navigatorKey.currentState!.context);
  static ProductsCubit get instance => _productsCubit;
////////////////////////////////////////////////////////////////////////////////

  AddProductUseCase addProductUseCase;

  addProduct({
    required String name,
    required double price ,
    required String description ,
    required double discount ,
    required int categoryId ,
    required File image,
    dynamic imageByte,
    required bool isImageExist,
  }) async {
    emit(AddProductLoadingState());
    final result = await addProductUseCase(name, price, description, discount,categoryId,image,imageByte,isImageExist);
    result.fold((failure) {
      emit(AddProductFailureState());
    }, (createWorkSpace) {
      if (createWorkSpace.isSuccess == true) {
        emit(AddProductSuccessState());
      } else {
        emit(AddProductErrorState());
      }
    });
  }

}