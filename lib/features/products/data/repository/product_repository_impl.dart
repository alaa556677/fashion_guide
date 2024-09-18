import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fashion_guide/core/constants/failure.dart';
import '../../domain/entity/add_category_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../data_source/add_product_data_source.dart';

class ProductRepoImpl implements ProductRepo{

  ProductRepoImpl(this.addProductDataSource);

  AddProductDataSource addProductDataSource;

  @override
  Future<Either<Failure, AddProductEntity>> addProduct(String name, double price, String description, double discount, int categoryId, File image, imageByte, bool isImageExist) async{
    try {
      return Right(await addProductDataSource.addCategory(name,price,description, discount,categoryId,image,imageByte,isImageExist));
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

}