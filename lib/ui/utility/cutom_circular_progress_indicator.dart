import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomCircularProgressIndicator extends StatelessWidget {
  bool isFullScreen;

  CustomCircularProgressIndicator({Key? key, this.isFullScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  bool isFullScreen;
  String? errorText;

  ErrorView(
      {Key? key,
      this.isFullScreen = false,
      this.errorText = "Something went wrong"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText ?? "Something went wrong",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
