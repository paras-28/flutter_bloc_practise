import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/controllers/home/home_controller_bloc.dart';
import 'package:flutter_bloc_practise/ui/utility/cutom_circular_progress_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../controllers/home_view_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeControllerBloc>().add(ApiHitHomeControllerEvent());
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: BlocConsumer<HomeControllerBloc, HomeControllerState>(
          // init: ProductController(),
          listener: (context, state) => {},
          builder: (context, state) {
            if (state is HomeControllerLoadingState) {
              return CustomCircularProgressIndicator();
            } else if (state is HomeControllerLoadedState) {
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
                errorText: 'Something went wrong',
              );
            }
          }),
    );
  }
}
