import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(235, 138, 30, 0.9),
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
