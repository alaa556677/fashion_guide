abstract class ProductsStates{}

class InitialProductsState extends ProductsStates{}


class AddProductLoadingState extends ProductsStates{}

class AddProductFailureState extends ProductsStates{
  String message;
  AddProductFailureState(this.message);
}

class AddProductErrorState extends ProductsStates{
  String message;
  AddProductErrorState(this.message);
}

class AddProductSuccessState extends ProductsStates{}

class UploadImageLoading extends ProductsStates{}

class UploadImageSuccess extends ProductsStates{}

class UploadImageError extends ProductsStates{}

class GetCategoriesLoadingState extends ProductsStates{}

class GetCategoriesFailureState extends ProductsStates{}

class GetCategoriesErrorState extends ProductsStates{}

class GetCategoriesSuccessState extends ProductsStates{}

class ChangeSelectProduct extends ProductsStates{}