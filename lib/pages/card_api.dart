import 'package:dars4/pages/db.dart';
import 'package:dars4/pages/product_model.dart';
import 'package:dio/dio.dart';

class CardApi {
  final Db _db; //namuna uchun
  final Dio _dio;

  CardApi(this._db, this._dio) {
    print("CardApi");
  }

  Future<List<ProductModel>> products(int categoryId) async {
    // throw "Ruxsat etilmagan user";
    await Future.delayed(const Duration(seconds: 2));
    final response = await _dio.get("/catalogs/categories/$categoryId");

    // final List list = response.data["data"]["products"];
    // final products = <ProductModel>[];
    // for (int i = 0; i < list.length; i++) {
    //   products.add(ProductModel.fromJson(list[i]));
    // }
    // return products;
    print(response.data["data"]["products"]);

    return (response.data["data"]["products"] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
