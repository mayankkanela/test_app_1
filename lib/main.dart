import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_1/core/app_router/app_router.dart';
import 'package:test_app_1/features/astro_app/presentation/bloc/question_bloc/questions_bloc.dart';
import 'package:test_app_1/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuestionsBloc>(
          create: (context) => sl<QuestionsBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

// https://stackoverflow.com/questions/54069239/whats-the-best-practice-to-keep-all-the-constants-in-flutter
