import 'package:dars4/pages/card_api.dart';
import 'package:dars4/pages/db.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

void setup() {
  di.registerLazySingleton(() => Db());
  // di.registerSingleton(Db());
  // di.registerFactory(() => Db());
  di.registerLazySingleton(
    () => CardApi(
      di.get(),
      Dio(BaseOptions(baseUrl: "https://catalog.korzinka.uz/api")),
    ),
  );
}
