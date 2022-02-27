import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_1/core/network/network_info.dart';
import 'package:test_app_1/features/astro_app/data/datasources/questions_local_data_source.dart';
import 'package:test_app_1/features/astro_app/data/datasources/questions_remote_data_source.dart';
import 'package:test_app_1/features/astro_app/data/repositories/questions_repository_impl.dart';
import 'package:test_app_1/features/astro_app/domain/repositories/questions_repository.dart';
import 'package:test_app_1/features/astro_app/domain/usecases/get_questions.dart';
import 'package:test_app_1/features/astro_app/presentation/bloc/question_bloc/questions_bloc.dart';
import 'package:test_app_1/features/astro_app/presentation/cubit/category_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - GithubRepo
  // Bloc
  sl.registerFactory(() => QuestionsBloc(getQuestions: sl()));
  sl.registerFactory(() => CategoryCubit());
  // Use Case
  sl.registerLazySingleton(() => GetQuestions(sl()));

  // Repository
  sl.registerLazySingleton<QuestionsRepository>(() => QuestionsRepositoryImpl(
      networkInfo: sl(),
      questionsLocalDataSource: sl(),
      questionsRemoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<QuestionsRemoteDataSource>(
      () => QuestionsRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<QuestionsLocalDataSource>(
      () => QuestionsLocalDataSourceImpl(sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
