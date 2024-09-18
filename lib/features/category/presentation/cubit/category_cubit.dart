import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit <CategoryStates>{
  CategoryCubit() : super(InitialCategoryState());

  static final CategoryCubit _categoryCubit = BlocProvider.of<CategoryCubit>(navigatorKey.currentState!.context);
  static CategoryCubit get instance => _categoryCubit;

////////////////////////////////////////////////////////////////////////////////



}