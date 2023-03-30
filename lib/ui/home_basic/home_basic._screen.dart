import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/controllers/home_basic/home_basic_bloc.dart';
import 'package:flutter_bloc_practise/ui/utility/cutom_circular_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../controllers/home_view_controller.dart';

class HomeBasicScreen extends StatefulWidget {
  const HomeBasicScreen({Key? key}) : super(key: key);

  @override
  State<HomeBasicScreen> createState() => _HomeBasicScreenState();
}

class _HomeBasicScreenState extends State<HomeBasicScreen> {

  @override
  void initState() {
    context.read<HomeBasicBloc>().add(HomeBasicEventHitApi());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          context.read<HomeBasicBloc>().add(HomeBasicEventAnother());
        },

      ),
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 17.0,
            ),
          ),
        ),
      ),
      body: BlocConsumer<HomeBasicBloc, HomeBasicState>(
          listener: (context, state) => {},
          builder: (context, state) {
            if (state.showLoader) {
              return const CustomCircularProgressIndicator();
            } else if (state.list.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      index.toString(),
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    title: Text(
                      state.list[index].title.toString() ?? "Fake",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return ErrorView(
                errorText: state.hasError,
              );
            }
          }),
    );
  }
}
