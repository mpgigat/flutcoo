import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pruebaflutter1/screens/homescreen.dart';
import 'package:pruebaflutter1/screens/identidadscreen.dart';
import 'package:pruebaflutter1/screens/pesemscreen.dart';
import 'package:pruebaflutter1/widgets/activities/crossword/views/crosswordscreen.dart';

import 'package:pruebaflutter1/widgets/activities/puzzle/ui/pages/game/game_view.dart';
import 'package:pruebaflutter1/widgets/activities/quizz/views/quizz_screen.dart';
import 'package:pruebaflutter1/widgets/activities/sopa/view/game_screen.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/views/game_view_word_search.dart';
import 'package:pruebaflutter1/widgets/commons/animatelist.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/estructuraorganizacional/estructurascreen.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/identidadvisual/identidadvisualscreen.dart';
import 'package:pruebaflutter1/screens/politicascreen.dart';
import 'package:pruebaflutter1/screens/quienessomosscreen.dart';
import 'package:pruebaflutter1/screens/resenascreen.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/mision/mvscreen.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/valorescorporativos/vcscreen.dart';
import 'package:pruebaflutter1/widgets/pesem/colegio/colegioscreen.dart';
import 'package:pruebaflutter1/widgets/pesem/instituto/institutoscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coomuldesa',
      initialRoute: 'homescreen',
      theme: ThemeData(
          primaryColor: const Color(0xfffd6220),
          primaryColorDark: const Color.fromARGB(216, 209, 81, 26)),
      routes: {
        'homescreen': (_) => const HomeScreen(),
        'quienesscreen': (_) => const QuienesSomosScreen(),
        'resenascreen': (_) => const ResenaScreen(),
        'politicascreen': (_) => const PoliticaScreen(),
        // 'identidadcorporativascreen': (_) => const IdentidadCorporativaScreen(),
        'identidadscreen': (_) => const IdentidadScreen(),
        'identidadvisualscreen': (_) => const IdentidadVisual(),
        'misionvisionscreen': (_) => const MVScreen(),
        'valorescorporativosscreen': (_) => const VCScreen(),
        'estructurascreen': (_) => const EstructuraScreen(),
        'pesemscreen': (_) => const PesemScreen(),
        'colegioscreen': (_) => const ColegioScreen(),
        'institutoscreen': (_) => const InstitutoScreen(),
        'puzzlecoomuldillo': (_) => const GameView(
              rutaAssets: 'assets/activities/puzzle/coomuldillo/coomuldillo',
              tittle: '¿TE ACUERDAS DE COOMULDILLO?',
            ),
        'puzzlevision': (_) => const GameView(
              rutaAssets: 'assets/activities/puzzle/vision/vision',
              tittle: '¿NUESTRA VISION ES?',
            ),
        'sopaletrasscreen': (_) => const SopaLetrasScreen(),
        'animatelist': (_) => const AnimateListWidget(),
        'wordsearch': (_) => const GameViewWordSearch(),
        'quizzscreen': (_) => const QuizzScreen(),
        'crosswordscreen': (_) => const CrossWordScreen(),
      },
    );
  }
}
