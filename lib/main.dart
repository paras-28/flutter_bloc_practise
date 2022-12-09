import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/controllers/home/home_controller_bloc.dart';
import 'package:flutter_bloc_practise/ui/homepage.dart';

void main() {
  // for counter app
  // runApp(MyCounterApp());

  runApp(
    MultiBlocProvider(
        providers: [BlocProvider(create: (_) => HomeControllerBloc())],
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyCounterApp(),
      home: HomeView(),
    );
  }
}
