import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';

import 'package:pruebaflutter1/widgets/identidadcorporativa/icsplashwidget.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/smidentidadcorporativa.dart';

class IdentidadCorporativaScreen extends StatelessWidget {
  const IdentidadCorporativaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: invertColorsMaterial(context),
        body: WillPopScope(
            onWillPop: handleBackPressed,
            child: Stack(
              children: const [
                BackgroundWidget(),
                ICSplahsWidget(),
                 SMIdentidadCorporativa(),
                // BackWidget(ruta: "homescreen"),
              ],
            )));
  }

  Future<bool> handleBackPressed() {
    // if (isBottomSheetOpen) {
    //   toggleBottomSheet();
    //   return Future.value(false);
    // }
    return Future.value(true);
  }
}
