import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebaflutter1/providers/models/icmodel.dart';

import 'package:pruebaflutter1/widgets/identidadcorporativa/smcarditem.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

import '../../utils/ui_helpers.dart';

const double minHeight = 80;
const double iconStartSize = 75;
const double iconEndSize = 110;
const double iconStartMarginTop = -15;
const double iconEndMarginTop = 50;
const double iconsVerticalSpacing = 0;
const double iconsHorizontalSpacing = 0;
AnimationController? controller;

// void toggleBottomSheet() =>
//     controller?.fling(velocity: isBottomSheetOpen ? -2 : 2);

bool get isBottomSheetOpen => (controller?.status == AnimationStatus.completed);

class SMIdentidadCorporativa extends StatefulWidget {
  const SMIdentidadCorporativa({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SMIdentidadCorporativaState createState() => _SMIdentidadCorporativaState();
}

class _SMIdentidadCorporativaState extends State<SMIdentidadCorporativa>
    with SingleTickerProviderStateMixin {
  double get maxHeight => MediaQuery.of(context).size.height;
  double? get headerTopMargin =>
      lerp(16, 0 + MediaQuery.of(context).padding.top);

  double? get itemBorderRadius => lerp(8, 15);

  double? get iconSize => lerp(iconStartSize, iconEndSize);

  double iconTopMargin(int index) =>
      lerp(
        iconStartMarginTop,
        iconEndMarginTop + index * (iconsVerticalSpacing + iconEndSize),
      )! +
      headerTopMargin!;

  double? iconLeftMargin(int index) =>
      lerp(index * (iconsHorizontalSpacing + iconStartSize), 0);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  double? lerp(double min, double max) =>
      lerpDouble(min, max, controller!.value);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MenuAnimado(),
      ],
    );
  }

  AnimatedBuilder MenuAnimado() {
    return AnimatedBuilder(
      animation: controller!,
      builder: ((context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor(context),
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: Material(
              //   color: invertColorsMild(context),
              elevation: 10,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              shadowColor: shadowColor(context),
              child: InkWell(
                onTap: doNothing,
                //splashColor: invertColorsMaterial(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ChangeNotifierProvider(
                    create: (context) => IcModel(),
                    child: Stack(
                      children: [
                        const MenuButton(),
                        for (SheetItem item in items)
                          buildFullItem(item), //texto
                        for (SheetItem item in items) buildIcon(item),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildIcon(SheetItem item) {
    int index = items.indexOf(item);
    return Positioned(
      height: iconSize,
      width: iconSize,
      top: iconTopMargin(index),
      left: iconLeftMargin(index),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Consumer<IcModel>(
            builder: (context, icModel, child) => Icon(
              item.icon,
              color: icModel.colorIcon
                  ? Colors.white
                  : Color.fromARGB(255, 109, 102, 102),
            ),
          ),
          // child: Image.asset(
          //   'assets/ic/mv_coomuldesa.PNG',
          //   fit: BoxFit.cover,
          //   //  alignment: Alignment(lerp(0, 0), 0),
          // ),
        ),
      ),
    );
  }

  Widget buildFullItem(SheetItem item) {
    int index = items.indexOf(item);
    return ExpandedSheetItem(
      topMargin: iconTopMargin(index),
      leftMargin: iconLeftMargin(index)!,
      height: iconSize!,
      isVisible: controller!.status == AnimationStatus.completed,
      borderRadius: itemBorderRadius!,
      title: item.title,
      textButton: item.textButton,
      ruta: item.ruta,
    );
  }
}

class ExpandedSheetItem extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final double height;
  final bool isVisible;
  final double borderRadius;
  final String title;
  final String textButton;
  final String ruta;

  const ExpandedSheetItem(
      {super.key,
      required this.topMargin,
      required this.height,
      required this.isVisible,
      required this.borderRadius,
      required this.title,
      required this.textButton,
      required this.leftMargin,
      required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      left: leftMargin,
      right: 0,
      height: height,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: SMCardItem(
            //color: invertColorsMaterial(context),
            color: Theme.of(context).primaryColor,
            splashColor: invertInvertColorsMaterial(context),
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100.0,
                  ),
                  child: Text(
                    textButton,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Agne",
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    // style: isThemeCurrentlyDark(context)
                    //     ? SubHeadingStylesMaterial.light
                    //     : SubHeadingStylesMaterial.dark,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: <Widget>[
        Text(
          'Fix me $title',
        ),
      ],
    );
  }
}

IconButton misionVision = IconButton(
  icon: Image.asset('assets/images/icons/logout.png'),
  onPressed: () => {},
);

final List<SheetItem> items = [
  SheetItem(
      Icons.filter_1_rounded, 'Icon1', 'Misión - Visión', 'misionvisionscreen'),
  SheetItem(Icons.filter_2_rounded, 'Icon2', 'Identidad Visual',
      'identidadvisualscreen'),
  SheetItem(Icons.filter_3_rounded, 'Icon3', 'Valores Corporativos',
      'valorescorporativosscreen'),
  SheetItem(Icons.filter_4_rounded, 'Icon4', 'Estructura Organizacional',
      'estructurascreen'),
];

class SheetItem {
  // final String assetName;
  // final String title;
  final IconData icon;
  final String title;
  final String textButton;
  final String ruta;

  SheetItem(this.icon, this.title, this.textButton, this.ruta);
}

// class MenuButton extends StatelessWidget {
//   const MenuButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       right: 0,
//       bottom: 30,
//       child: GestureDetector(
//         onTap: toggleBottomSheet,
//         child: AnimatedIcon(
//           icon: AnimatedIcons.menu_close,
//           size: 24.0,
//           progress: controller!,
//           semanticLabel: 'Open/close',
//           color: invertColorsMild(context),
//         ),
//       ),
//     );
//   }
// }

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: Control.mirror,
      tween: Tween(begin: 20.0, end: 28.0),
      duration: const Duration(seconds: 2),
      delay: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      startPosition: 0.5,
      animationStatusListener: (status) {
        debugPrint('status updated: $status');
      },
      builder: (context, value, child) {
        return IconoAnimado(
          valueAnimation: value,
        );
      },
    );
  }
}

class IconoAnimado extends StatelessWidget {
  const IconoAnimado({
    Key? key,
    required this.valueAnimation,
  }) : super(key: key);
  final double valueAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 30,
      child: Consumer<IcModel>(
        builder: (context, icModel, child) => GestureDetector(
          onTap: () {
            controller?.fling(velocity: isBottomSheetOpen ? -2 : 2);
            icModel.colorIcon
                ? icModel.colorIconNegro()
                : icModel.colorIconBlanco();
          },
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            size: valueAnimation,
            progress: controller!,
            semanticLabel: 'Open/close',
            color: invertColorsMild(context),
          ),
        ),
      ),
    );
  }
}
