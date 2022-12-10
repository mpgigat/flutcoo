import 'package:flutter/material.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key, required this.ruta});
  final String ruta;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(AppBar().preferredSize.height),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 32, 62, 32),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, ruta);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
