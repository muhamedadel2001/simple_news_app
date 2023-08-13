import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/business_logic/app_cubit.dart';
import 'package:newsapp/presentation/router/app_router.dart';
import 'package:sizer/sizer.dart';

import 'core/my_bloc_observer.dart';
import 'data/remote/data_providers/my_dio.dart';

void main() {
  //noo
  Bloc.observer = MyBlocObserver();
  MyDio.dioInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'news app',
          theme: ThemeData(
<<<<<<< HEAD
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
=======
>>>>>>> b1c5344 (remove comments)
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      );
    });
  }
}
