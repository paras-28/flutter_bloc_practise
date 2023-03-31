import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/controllers/home/home_controller_bloc.dart';
import 'package:flutter_bloc_practise/ui/bloac_into_another_bloc/testing_bloc_screen.dart';
import 'package:flutter_bloc_practise/ui/home_basic/home_basic._screen.dart';
import 'package:flutter_bloc_practise/ui/homepage.dart';

import 'controllers/home_basic/home_basic_bloc.dart';


//Info
//HomeControllerBloc is Equatable approach

void main() {
  // for counter app
  // runApp(MyCounterApp());

  runApp(
    MultiBlocProvider(
        providers: [

          BlocProvider(create: (_) => HomeControllerBloc()),
          BlocProvider(create: (_) => HomeBasicBloc())
        ],
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
      //Info for homeController
      //  home: HomeView(),
      //Info for HomeBasic
      // home: HomeBasicScreen(),
      //Info testing one bloc into another
      home : TestingBlocScreen()
    );
  }
}
