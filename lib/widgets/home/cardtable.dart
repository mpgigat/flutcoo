// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(children: const [
      TableRow(children: [
        _SingleCard(
          //color: Color.fromARGB(255, 4, 62, 6),
          icon: Icons.account_balance,
          text: "Quienes Somos",
          ruta: "quienesscreen",
        ),
        _SingleCard(
          icon: Icons.history,
          text: "Reseña",
          ruta: "resenascreen",
        ),
      ]),
      TableRow(children: [
        _SingleCard(
          icon: Icons.shield_outlined,
          text: "Identidad Corporativa",
          ruta: "identidadscreen",
        ),
        _SingleCard(
          icon: Icons.fact_check_outlined,
          text: "Politica de Calidad",
          ruta: "politicascreen",
        ),
      ]),
      TableRow(
        children: [
          _SingleCard(
            icon: Icons.movie,
            text: "Proyecto Pesem",
            ruta: "pesemscreen",
          ),
          _SingleCard(
            icon: Icons.food_bank_outlined,
            text: "Grocery",
            ruta: "aplausoswidget",
          )
        ],
      ),
    ]);
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String ruta;

  const _SingleCard(
      {super.key, required this.icon, required this.text, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, this.ruta);
        },
        child: Container(
          height: 180,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color.fromARGB(88, 46, 92, 46),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 22, 122, 89),
                radius: 30,
                child: Icon(
                  this.icon,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                this.text,
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 49, 24),
                    // fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
