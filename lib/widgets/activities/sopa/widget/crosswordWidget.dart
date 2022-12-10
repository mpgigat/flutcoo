import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/chipswidget.dart';
import 'package:word_search_safety/word_search_safety.dart';

class CrosswordWidget extends StatefulWidget {
  const CrosswordWidget({Key? key}) : super(key: key);

  @override
  State<CrosswordWidget> createState() => _CrosswordWidgetState();
}

class _CrosswordWidgetState extends State<CrosswordWidget> {
  int numBoxPerRow = 15;
  double padding = 3;
  Size sizeBox = Size.zero;

  List<String>? wordList;

  ValueNotifier<List<List<String>>>? listChars;
  ValueNotifier<List<CrosswordAnswer>>? answerList;
  ValueNotifier<CurrentDragObj>? currentDragObj;
  ValueNotifier<List<int>>? charsDone;
  ValueNotifier<List>? words;

  @override
  void initState() {
    super.initState();
    listChars = ValueNotifier<List<List<String>>>([]);
    answerList = ValueNotifier<List<CrosswordAnswer>>([]);
    currentDragObj = ValueNotifier<CurrentDragObj>(CurrentDragObj());
    charsDone = ValueNotifier<List<int>>(<int>[]);
    words = ValueNotifier<List>([]);

    //Controlador listener para mostrar un showDialog cuando la longitud de la lista palabras sea igual a la longitud de wordList
    answerList!.addListener(() {
      if ((words!.value.length) + 1 == wordList!.length) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Felicidades'),
                content: const Text('Has completado la sopa de letras'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'))
                ],
              );
            });
      }
    });

    //metodo para generar una palabra aleatoria
    generateRandomWord();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  height: size.width - 12.5 * padding,
                  // color: Colors.black,
                  padding: const EdgeInsets.only(top: 1),
                  margin: EdgeInsets.only(
                      bottom: padding,
                      top: padding + 15,
                      left: padding + 6,
                      right: padding + 6),
                  child: drawCrosswordBox(),
                ),
                Container(alignment: Alignment.center, child: drawAnswerList())
              ],
            ),
          ),
        ));
  }

  void onDragEnd(PointerUpEvent? event) {
    if (currentDragObj!.value.currentDragLine == null) {
      return;
    }

    currentDragObj!.value.currentDragLine.clear();
    currentDragObj!.notifyListeners();
  }

  void onDragUpdate(PointerMoveEvent event) {
    generateLineOnDrag(event);

    int indexFound = answerList!.value.indexWhere((answer) {
      return answer.answerLines!.join("-") ==
          currentDragObj!.value.currentDragLine.join("-");
    });

    if (indexFound >= 0) {
      answerList!.value[indexFound].done = true;
      charsDone!.value.addAll(answerList!.value[indexFound].answerLines!);
      charsDone!.notifyListeners();
      answerList!.notifyListeners();
      onDragEnd(null);
    }
  }

//funcion
  calculateIndexBasePosLocal(Offset localPosition) {
    double maxSizeBox =
        ((sizeBox.width - (numBoxPerRow - 1) * padding) / numBoxPerRow);

    if (localPosition.dy > sizeBox.width || localPosition.dx > sizeBox.width) {
      return -1;
    }

    int x = 0, y = 0;
    double yAxis = 0, xAxis = 0;
    double yAxisStart = 0, xAxisStart = 0;

    for (var i = 0; i < numBoxPerRow; i++) {
      xAxisStart = xAxis;
      xAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (xAxisStart < localPosition.dx && xAxis > localPosition.dx) {
        x = i;
        break;
      }
    }

    for (var i = 0; i < numBoxPerRow; i++) {
      yAxisStart = yAxis;
      yAxis += maxSizeBox +
          (i == 0 || i == (numBoxPerRow - 1) ? padding / 2 : padding);

      if (yAxisStart < localPosition.dy && yAxis > localPosition.dy) {
        y = i;
        break;
      }
    }

    return y * numBoxPerRow + x;
  }

  void generateLineOnDrag(PointerMoveEvent event) {
    if (currentDragObj!.value.currentDragLine == null) {
      currentDragObj!.value.currentDragLine = <int>[];
    }

    int indexBase = calculateIndexBasePosLocal(event.localPosition);

    if (indexBase >= 0) {
      if (currentDragObj!.value.currentDragLine.length >= 2) {
        WSOrientation? wsOrientation;

        if (currentDragObj!.value.currentDragLine[0] % numBoxPerRow ==
            currentDragObj!.value.currentDragLine[1] % numBoxPerRow) {
          wsOrientation = WSOrientation.vertical;
        } else if (currentDragObj!.value.currentDragLine[0] ~/ numBoxPerRow ==
            currentDragObj!.value.currentDragLine[1] ~/ numBoxPerRow) {
          wsOrientation = WSOrientation.horizontal;
        }

        if (wsOrientation == WSOrientation.horizontal) {
          if (indexBase ~/ numBoxPerRow !=
              currentDragObj!.value.currentDragLine[1] ~/ numBoxPerRow) {
            onDragEnd(null);
          }
        } else if (wsOrientation == WSOrientation.vertical) {
          if (indexBase % numBoxPerRow !=
              currentDragObj!.value.currentDragLine[1] % numBoxPerRow) {
            onDragEnd(null);
          }
        } else {
          onDragEnd(null);
        }
      }

      if (!currentDragObj!.value.currentDragLine.contains(indexBase)) {
        currentDragObj!.value.currentDragLine.add(indexBase);
      } else if (currentDragObj!.value.currentDragLine.length >= 2) {
        if (currentDragObj!.value.currentDragLine[
                currentDragObj!.value.currentDragLine.length - 2] ==
            indexBase) {
          onDragEnd(null);
        }
      }

      currentDragObj!.notifyListeners();
    }
  }

  void onDragStart(int indexArray) {
    try {
      List<CrosswordAnswer> indexSelecteds = answerList!.value
          .where((ansawer) => ansawer.indexArray == indexArray)
          .toList();

      if (indexSelecteds.isNotEmpty) {
        return;
      }

      currentDragObj!.value.indexArrayOnTouch = indexArray;
      currentDragObj!.notifyListeners();
    } catch (e) {}
  }

  //Widget encargado de pintar toda la caja y contenido de la sopa de letras
  Widget drawCrosswordBox() {
    return Listener(
      onPointerUp: (event) => onDragEnd(event),
      onPointerMove: (event) => onDragUpdate(event),
      child: LayoutBuilder(builder: (context, constraints) {
        sizeBox = Size(constraints.maxWidth, constraints.maxWidth);
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: numBoxPerRow,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1),
          itemCount: numBoxPerRow * numBoxPerRow,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) {
            String char = listChars!.value.expand((e) => e).toList()[index];
            return Listener(
              onPointerDown: (event) => onDragStart(index),
              child: ValueListenableBuilder(
                valueListenable: currentDragObj!,
                builder: (context, CurrentDragObj value, child) {
                  Color color = Colors.white;

                  if (value.currentDragLine.contains(index)) {
                    color = const Color.fromRGBO(0, 170, 0, 0.8);
                  } else if (charsDone!.value.contains(index)) {
                    color = const Color.fromRGBO(255, 190, 70, 1);
                  }

                  return Container(
                    width: ((sizeBox.width - (numBoxPerRow - 1) * padding) /
                        numBoxPerRow),
                    margin: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: color,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      char.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }

  void generateRandomWord() {
    wordList = [
      'calidad',
      'satisfaccion',
      'ahorro',
      'servicio',
      'desarrollo',
      'mejora',
      'credito',
      'compromiso',
      'financiera'
    ];

    final WSSettings ws = WSSettings(
      height: numBoxPerRow,
      width: numBoxPerRow,
      orientations: List.from([
        WSOrientation.horizontal,
        WSOrientation.horizontalBack,
        WSOrientation.vertical,
        WSOrientation.verticalUp,
      ]),
    );

    final WordSearchSafety wordSearch = WordSearchSafety();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wordList!, ws);

    if (newPuzzle.errors!.isEmpty) {
      listChars!.value = newPuzzle.puzzle!;

      final WSSolved solved =
          wordSearch.solvePuzzle(newPuzzle.puzzle!, wordList!);

      answerList!.value = solved.found!
          .map((solve) => CrosswordAnswer(solve, numPerRow: numBoxPerRow))
          .toList();
    }
  }

  drawAnswerList() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: ValueListenableBuilder(
        valueListenable: answerList!,
        builder: (context, List<CrosswordAnswer> value, child) {
          int perColTotal = 3;

          List<Widget> list = List.generate(
              (value.length ~/ perColTotal) +
                  ((value.length % perColTotal) > 0 ? 1 : 0), (int index) {
            int maxColumn = (index + 1) * perColTotal;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    maxColumn > value.length
                        ? maxColumn - value.length
                        : perColTotal, ((indexChild) {
                  int indexArray = (index) * perColTotal + indexChild;

                  if (value[indexArray].done) {
                    //validar si la palabra ya esta en la lista palabras
                    if (!words!.value
                        .contains(value[indexArray].wsLocation!.word)) {
                      words!.value.add(value[indexArray].wsLocation!.word);
                    }
                  }
                  return ChipsWidget(
                    label: value[indexArray].wsLocation!.word.toUpperCase(),
                    done: value[indexArray].done,
                  );
                  // return ChicpsBasic(
                  //   item: value[indexArray].wsLocation!.word.toUpperCase(),
                  //   done: value[indexArray].done,
                  // );
                })),
              ),
            );
          });

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: list,
          );
        },
      ),
    );
  }
}

class ChicpsBasic extends StatelessWidget {
  const ChicpsBasic({
    Key? key,
    required this.item,
    required this.done,
  }) : super(key: key);

  final String item;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Center(
        child: SizedBox(
          width: 100,
          height: 20,
          child: Center(
            child: Center(
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: done
                      ? const Color.fromARGB(255, 226, 16, 16)
                      : Colors.black,
                  decoration:
                      done ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurrentDragObj {
  Offset? currentDragPos;
  Offset? currentTouch;
  int? indexArrayOnTouch;
  List<int> currentDragLine = <int>[];

  CurrentDragObj({this.currentTouch, this.indexArrayOnTouch});
}

class CrosswordAnswer {
  bool done = false;
  int? indexArray;
  WSLocation? wsLocation;
  List<int>? answerLines;

  CrosswordAnswer(this.wsLocation, {int? numPerRow}) {
    this.indexArray = this.wsLocation!.y * numPerRow! + this.wsLocation!.x;
    generateAnswerLine(numPerRow);
  }

  void generateAnswerLine(int numPerRow) {
    this.answerLines = <int>[];

    this.answerLines!.addAll(List<int>.generate(this.wsLocation!.overlap,
        (index) => generateIndexBaseOnAxis(this.wsLocation, index, numPerRow)));
  }

  generateIndexBaseOnAxis(WSLocation? wsLocation, int i, int numPerRow) {
    int x = wsLocation!.x, y = wsLocation.y;

    if (wsLocation.orientation == WSOrientation.horizontal ||
        wsLocation.orientation == WSOrientation.horizontalBack) {
      x = (wsLocation.orientation == WSOrientation.horizontal) ? x + i : x - i;
    } else {
      y = (wsLocation.orientation == WSOrientation.vertical) ? y + i : y - i;
    }
    return x + y * numPerRow;
  }
}
