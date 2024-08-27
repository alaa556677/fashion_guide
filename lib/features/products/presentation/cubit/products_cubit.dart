import 'package:fashion_guide/features/products/presentation/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../../data/model/products_data_model.dart';

class ProductsCubit extends Cubit <ProductsStates>{
  ProductsCubit() : super(InitialProductsState());
  static final ProductsCubit _productsCubit = BlocProvider.of<ProductsCubit>(navigatorKey.currentState!.context);
  static ProductsCubit get instance => _productsCubit;
////////////////////////////////////////////////////////////////////////////////

}