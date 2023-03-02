import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:vakinha_burger/app/core/rest_client/custom_dio.dart';
import 'package:vakinha_burger/app/models/product_model.dart';

import '../core/exceptions/exceptions.dart';
import 'products_repository.dart';

class ProductRepositoryImpl implements ProductsRepository {
  final CustomDio dio;

  ProductRepositoryImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>((p) => ProductModel.fromJson(p))
          .toList();
    } on DioError catch (e, s) {
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar produtos");
    }
  }
}
