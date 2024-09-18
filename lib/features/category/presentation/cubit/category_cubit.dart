import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../../domain/use_cases/add_category_use_case.dart';
import '../../domain/use_cases/categories_use_case.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit <CategoryStates>{
  CategoryCubit(this.addCategoryUseCase,) : super(InitialCategoryState());

  static final CategoryCubit _categoryCubit = BlocProvider.of<CategoryCubit>(navigatorKey.currentState!.context);
  static CategoryCubit get instance => _categoryCubit;

////////////////////////////////////////////////////////////////////////////////

  AddCategoryUseCase addCategoryUseCase;

  addCategory({required String name}) async {
    emit(AddCategoryLoadingState());
    final result = await addCategoryUseCase(name);
    result.fold((failure) {
      emit(AddCategoryFailureState());
    },(addCategory) {
      if (addCategory.isSuccess == true) {
        emit(AddCategorySuccessState());
      } else {
        emit(AddCategoryErrorState());
      }
    });
  }
////////////////////////////////////////////////////////////////////////////////


}