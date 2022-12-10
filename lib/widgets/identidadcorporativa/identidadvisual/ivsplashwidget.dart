import 'package:flutter/material.dart';

class IVSplashWidget extends StatefulWidget {
  const IVSplashWidget({super.key, required this.animationController});
  final AnimationController animationController;
  @override
  State<IVSplashWidget> createState() => _IVSplashWidgetState();
}

class _IVSplashWidgetState extends State<IVSplashWidget> {
  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: const Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: _introductionanimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/introduction_animation/introduction_image.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "Clearhead",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 57, 55, 55)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 64, right: 64),
              child: Text(
                "Muchos son los factores que han contribuido con el proceso de fortalecimiento de Coomuldesa como entidad cooperativa y, entre ellos, sobresale el sentido de pertenencia que le profesan sus asociados",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 28, 27, 27)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 64, right: 64),
              child: Text(
                "Recorramos los diferentes símbolos que hoy facilitan su identificación en los diferentes entornos y despiertan sentimientos propios entre quienes la han visto crecer",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 28, 27, 27)),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: () {
                  widget.animationController.animateTo(0.2);
                },
                child: Container(
                  height: 58,
                  padding: const EdgeInsets.only(
                    left: 56.0,
                    right: 56.0,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: const Color(0xffffa200),
                  ),
                  child: const Text(
                    "Iniciemos",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 242, 238, 238),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
