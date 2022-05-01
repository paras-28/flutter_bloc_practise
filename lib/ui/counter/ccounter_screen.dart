import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/controllers/counter/counter_cubit.dart';

class MyCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: CounterScreen(title: 'Counter Practise'),
      ),
    );
  }
}

class CounterScreen extends StatefulWidget {
  CounterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {

                } else if (state.wasIncremented == false) {

                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'NEGATIVE ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'Even ' + state.counterValue.toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                }
                  else if (state.counterValue % 2 != 0) {
                  return Text(
                    'ODD ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                  else
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title}'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} #2'),
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).increment();
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
