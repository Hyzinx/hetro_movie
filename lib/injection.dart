import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hetro_anime/business/cubit/movie_cubit.dart';
import 'package:hetro_anime/data/api/credit_api.dart';
import 'package:hetro_anime/data/api/movie_api.dart';
import 'package:hetro_anime/data/api/review_api.dart';
import 'package:hetro_anime/data/repositories/credit_repository.dart';
import 'package:hetro_anime/data/repositories/movie_repository.dart';
import 'package:hetro_anime/data/repositories/review_repository.dart';

GetIt getIt = GetIt.instance;

void initializeDependency() {
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepository(getIt<MovieApi>()),
  );
  getIt.registerLazySingleton<ReviewRepository>(
    () => ReviewRepository(getIt<ReviewApi>()),
  );
  getIt.registerLazySingleton<CreditRepository>(
    () => CreditRepository(getIt<CreditApi>()),
  );

  getIt.registerLazySingleton<MovieCubit>(
    () => MovieCubit(
      getIt<MovieRepository>(),
      getIt<CreditRepository>(),
      getIt<ReviewRepository>(),
    ),
  );


  getIt.registerLazySingleton<MovieApi>(() => MovieApi(createAndSetupDio()));
  getIt.registerLazySingleton<ReviewApi>(() => ReviewApi(createAndSetupDio()));
  getIt.registerLazySingleton<CreditApi>(() => CreditApi(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = Duration(seconds: 50)
    ..options.receiveTimeout = Duration(seconds: 50);
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ),
  );
  return dio;
}
