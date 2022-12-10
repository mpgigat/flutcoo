import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/commons/homecardswidget.dart';
import 'package:pruebaflutter1/widgets/home/background.dart';

import 'package:pruebaflutter1/widgets/home/cardtable.dart';
import 'package:pruebaflutter1/widgets/home/pagetitle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //children: const [Background(), _HomeBody()],
        children: const [Background(), HomeCardsWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [PageTitle(), CardTable()],
      ),
    );
  }
}
