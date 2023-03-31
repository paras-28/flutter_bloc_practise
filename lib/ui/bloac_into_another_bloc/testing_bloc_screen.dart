import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/controllers/home/home_controller_bloc.dart';

import '../../controllers/home_basic/home_basic_bloc.dart';

class TestingBlocScreen extends StatefulWidget {
   TestingBlocScreen({Key? key}) : super(key: key);

  @override
  State<TestingBlocScreen> createState() => _TestingBlocScreenState();
}

class _TestingBlocScreenState extends State<TestingBlocScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              children:  [
                const   Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("HomeBloc Equatable",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24)),
                ),
                BlocConsumer<HomeControllerBloc, HomeControllerState>(
                    listener: (context, state)  {
                      debugPrint("Equatable : ${state}");
                    },
                    builder: (context, state) {
                      return  Text(state.toString());
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<HomeControllerBloc>().add(ApiHitHomeControllerEvent());
                          }, child: const Text("Event 1")),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Event 2")),
                    ],
                  ),
                )
              ],
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              children:  [
              const   Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("HomeBloc Basic Bloc",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24)),
                ),
                BlocConsumer<HomeBasicBloc, HomeBasicState>(
                  buildWhen: (previousState, currentState)
                    {
                      return   !currentState.communicateToAnotherBloc;
                    },
                    listener: (context, state)  {
                    debugPrint("BasicBloc : ${state.communicateToAnotherBloc}");
                    if(state.communicateToAnotherBloc)
                      {
                        context.read<HomeControllerBloc>().add(ApiHitHomeControllerEvent());
                      }
                    },
                    builder: (context, state) {
                      debugPrint("Basic Bloc : building again}");
                      return  Text(state.showLoader.toString());
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<HomeBasicBloc>().add(HomeBasicEventAnother());
                          }, child: const Text("Event 1")),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Event 2")),
                    ],
                  ),
                )

              ],
            ),
          )  ,          ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    HomeBasicState homeBasicState =   context.read<HomeBasicBloc>().state;
    HomeControllerState homeBlocState =   context.read<HomeControllerBloc>().state;
    debugPrint("Init State HomeBasicState : ${homeBasicState.showLoader}");
    debugPrint("Init State HomeControllerState: ${homeBlocState is HomeControllerLoadingState}");
  }
}
