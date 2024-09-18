import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';

import '../../../../core/shared/dio_helper.dart';
import '../model/AddProductModel.dart';

class AddProductDataSource {
  Uint8List? imageByte1;
  List<int> listData = [];
  String fileName = '';

  Future<AddCategoryModel> addCategory(
    String name,double price , String description , double discount , int categoryId , File image,dynamic imageByte,bool isImageExist,
  ) async {
    if (isImageExist == false) {
      Uint8List? imageByte1 = imageByte;
      listData = imageByte1!.cast();
      fileName = image.path.split('/').last;
    }
    FormData data = FormData.fromMap({
      "Name": name,
      "Price": price,
      "Description": description,
      "Discount": discount,
      "CategoryId": categoryId,
      "File": (isImageExist == false) ? null : await MultipartFile.fromBytes(listData, filename: fileName, contentType: MediaType("image", "PNG")),
    });
    final result = await DioHelper.postMultiPartData(
      url: 'api/Product/Create',
      data: data,
    );
    return AddCategoryModel.fromJson(result.data);
  }
}
