import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebaflutter1/providers/models/soundmodel.dart';

class CallSound extends StatefulWidget {
  const CallSound(
      {super.key,
      required this.tittle,
      required this.subTitle,
      required this.soundCard,
      required this.duration});
  final String tittle;
  final String subTitle;
  final String soundCard;
  final String duration;

  @override
  State<CallSound> createState() => _CallSoundState();
}

class _CallSoundState extends State<CallSound> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
      gradient: const LinearGradient(
          colors: [Color(0xff7ed957), Color(0xffc9e265)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
          topRight: Radius.circular(68.0)),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            offset: const Offset(1.1, 1.1),
            blurRadius: 10.0),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: boxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.tittle,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  // fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  letterSpacing: 0.0,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.subTitle,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    // fontFamily: FitnessAppTheme.fontName,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    letterSpacing: 0.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ChangeNotifierProvider(
                //builder: (context) => SoundModel(),
                create: (context) => SoundModel(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          widget.duration,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            //     fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: 0.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Consumer<SoundModel>(
                        builder: (context, soundModel, child) => Visibility(
                          visible: soundModel.isVisibleMix,
                          child: const MixButton(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Consumer<SoundModel>(
                        builder: (context, soundModel, child) => Visibility(
                          visible: soundModel.isVisiblePlay,
                          child: PlayButton(
                            assetsAudioPlayer: assetsAudioPlayer,
                            soundCard: widget.soundCard,
                          ),
                        ),
                      ),
                      Consumer<SoundModel>(
                        builder: (context, soundModel, child) => Visibility(
                            visible: soundModel.isVisibleStop,
                            child: StopButton(
                              assetsAudioPlayer: assetsAudioPlayer,
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
    required this.assetsAudioPlayer,
    required this.soundCard,
  }) : super(key: key);

  final AssetsAudioPlayer assetsAudioPlayer;
  final String soundCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        assetsAudioPlayer.open(
          Audio(soundCard),
        );
        var soundModel = context.read<SoundModel>();
        soundModel.yesVisibleMix();
        soundModel.notVisiblePlay();
        soundModel.yesVisibleStop();
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: const Color(0xFFFAFAFA).withOpacity(0.4),
                offset: const Offset(8.0, 8.0),
                blurRadius: 8.0),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(0.0),
          child: Icon(
            Icons.arrow_right,
            color: Color(0xff005c3d),
            size: 44,
          ),
        ),
      ),
    );
  }
}

class StopButton extends StatelessWidget {
  const StopButton({
    Key? key,
    required this.assetsAudioPlayer,
  }) : super(key: key);

  final AssetsAudioPlayer assetsAudioPlayer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        assetsAudioPlayer.stop();
        var soundModel = context.read<SoundModel>();
        soundModel.notVisibleMix();
        soundModel.notVisibleStop();
        soundModel.yesVisiblePlay();
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: const Color(0xFFFAFAFA).withOpacity(0.4),
                offset: const Offset(8.0, 8.0),
                blurRadius: 8.0),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(0.0),
          child: Icon(
            Icons.stop_rounded,
            color: Color(0xff005c3d),
            size: 44,
          ),
        ),
      ),
    );
  }
}

class MixButton extends StatelessWidget {
  const MixButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        shape: BoxShape.circle,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: const Color(0xFFFAFAFA).withOpacity(0.4),
              offset: const Offset(8.0, 8.0),
              blurRadius: 8.0),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(0.0),
        child: Icon(
          Icons.multitrack_audio,
          color: Color(0xff005c3d),
          size: 44,
        ),
      ),
    );
  }
}
