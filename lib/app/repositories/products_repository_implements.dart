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
      // final result = await dio.unauth().get('/products');
      final result = await [
        {
          "id": 1,
          "name": "X-Salada",
          "description":
              "Lanche acompanha pão, hambúguer, mussarela, alface, tomate e maionese",
          "price": 15.0,
          "image":
              "https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800"
        },
        {
          "id": 2,
          "name": "X-Burger",
          "description":
              "Lanche acompanha pão, hambúguer, mussarela e maionese",
          "price": 15.0,
          "image":
              "https://burgerx.com.br/assets/img/galeria/burgers/x-burger.jpg"
        },
        {
          "id": 3,
          "name": "X-Churrasco",
          "description":
              "Lanche acompanha pão francês, contra filé, alface, vinagrete, queijo e maionese",
          "price": 23.0,
          "image":
              "http://www.saboresajinomoto.com.br/uploads/images/recipes/sanduiche-de-churrasco.jpg"
        },
        {
          "id": 4,
          "name": "X-Egg",
          "description":
              "Lanche acompanha pão, hamburguer, queijo, ovo, maionese, alface e tomate",
          "price": 15.0,
          "image":
              "https://sachefmio.blob.core.windows.net/fotos/x-egg-73519.jpg"
        },
        {
          "id": 5,
          "name": "X-Calabresa",
          "description":
              "Lanche acompanha pão, calabresa, vinagrete, queijo e maionese",
          "price": 19.0,
          "image":
              "https://storage.googleapis.com/domain-images/daa9c855-3149-4d13-8da1-fcf5712742e4/products/gallery_106a48c5-c8b2-4657-b6dc-e623d536ae06.jpg"
        },
        {
          "id": 6,
          "name": "X-Bacon",
          "description":
              "Lanche acompanha pão, hambúrguer, fatias de bacon, queijo, maionese, alface e tomate",
          "price": 19.0,
          "image":
              "https://burger.eriklima.me/wp-content/uploads/2021/03/X-Bacon.jpg"
        },
        {
          "id": 7,
          "name": "Porção de 500g Batata frita simples",
          "description": "",
          "price": 19.0,
          "image":
              "https://www.botecogois.com.br/wp-content/uploads/2021/01/batata-frita-porcao.jpg"
        },
        {
          "id": 8,
          "name": "Porção de 500g Calabresa acebolada",
          "description": "",
          "price": 19.0,
          "image":
              "https://www.anamariabrogui.com.br/assets/uploads/receitas/fotos/usuario-1682-52acab79d88efd805e6a341697e6aecb.jpg"
        },
        {
          "id": 9,
          "name": "Porção de 500g Batata com Cheddar e Bacon",
          "description": "Batata Cheddar e Bacon",
          "price": 25.0,
          "image": "https://i.ytimg.com/vi/0Fea2vwfnN8/maxresdefault.jpg"
        }
      ];
      return result.map<ProductModel>((p) => ProductModel.fromJson(p)).toList();
    } on DioError catch (e, s) {
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      throw RepositoryException(message: "Erro ao buscar produtos");
    }
  }
}
