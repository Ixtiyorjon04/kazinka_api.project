import 'package:dars4/pages/db.dart';
import 'package:dio/dio.dart';

class CardApi {
  final Db _db;
  final Dio _dio;

  CardApi(this._db, this._dio) {
    print("CardApi");
  }

  void example() {
    _db.save("value");
    print("example");
  }
}
