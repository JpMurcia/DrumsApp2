import 'package:drumsapp2/src/utils/sounds_util.dart';
// import 'package:drumsapp2/src/widgets/instrument_matrix.dart';
import 'package:drumsapp2/src/widgets/instrument_matrix_exercises.dart';

import 'package:drumsapp2/src/widgets/tools_instrument_matrix.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MatrixCollectionExercises extends StatefulWidget {
  final List<List<int>> matrix;
  final String nameRhythms;
  final String nameExercio;
  MatrixCollectionExercises(
      {Key key, this.matrix, this.nameRhythms, this.nameExercio})
      : super(key: key);

  // const MatrixCollection({Key key}) : super(key: key);
  @override
  _MatrixCollectionExercisesState createState() =>
      _MatrixCollectionExercisesState();

  InstrumentMatrixExercises ins;
  get getIns => ins;
  set setIns(value) {
    ins = value;
  }
}

class _MatrixCollectionExercisesState extends State<MatrixCollectionExercises> {
  bool state = false;
  double rating = 100;

  @override
  void initState() {
    widget.setIns = InstrumentMatrixExercises(matrix: widget.matrix);
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    //SystemChrome.setPreferredOrientations([
    //  DeviceOrientation.landscapeRight,
    //  DeviceOrientation.landscapeLeft,
    //]);
  }

  @override
  Widget build(BuildContext context) {
    // GetBuilder<MatrizController>(
    //     // id: 'matriz',
    //     // init: MatrizController(),
    //     builder: (_) =>
    if (widget.matrix.length == 0) {
      return Center(
        child: LinearProgressIndicator(),
      );
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
      return SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      buttonSet(
                          _startButtonSet, _pauseButtonSet, _stopButtonSet),
                      switchMetronome(state, _changeSwitchMetronome),
                      speedSlider(rating, _changeSpeedSlider)
                    ],
                  ),
                  // instrumentMatrix(),
                  // instrumentMatrix(_.listResp)
                  widget.ins
                ],
              ),
              // pseudoSheetMusic(_.listResp[0].length,
              //     MediaQuery.of(context).size.width, _.name)
              pseudoSheetMusicExercises(
                  widget.matrix[0].length,
                  MediaQuery.of(context).size.width,
                  widget.nameRhythms,
                  widget.nameExercio,
                  context)
            ],
          ),
        ),
      );
    }
    // );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    state = false;
    _stopButtonSet();
    _changeSwitchMetronome(state);
    super.dispose();
  }

  _startButtonSet() {
    state = true;
    stopMetronome();
    _changeSwitchMetronome(state);
    playMatrix("exercises/${widget.nameExercio}");
    // playMatrix("Balada");
  }

  _pauseButtonSet() {
    pauseMatrix();
    state = false;
    _changeSwitchMetronome(state);
  }

  _stopButtonSet() {
    state = false;
    _changeSwitchMetronome(state);
    stopMatrix();
  }

  _changeSwitchMetronome(bool value) {
    setState(() {
      state = value;
    });

    if (!value) {
      stopMetronome();
    }
    if (value && !isSound) {
      // playMetronome();
      playMetronome(widget.matrix[0].length);
    }
  }

  _changeSpeedSlider(double value) {
    setState(() {
      rating = value;
      print(rating);
    });
  }
}
