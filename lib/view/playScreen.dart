import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meditation_app/custom_widgets/custom_text.dart';
import 'package:meditation_app/model/music_model.dart';
import 'package:meditation_app/view/interstitial_ad.dart';
import 'package:meditation_app/view/time_duration.dart';
// import 'dart:io' show Platform;

class PlayScreen extends StatefulWidget {
  final MusicModel musicModel;

  const PlayScreen({super.key, required this.musicModel});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  AdmobHelper admobHelper = AdmobHelper();

  late int _duration;
  final CountDownController _controller = CountDownController();
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 00;
  CountdownTimerController? controller;
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  bool isRepeat = false;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(4, '0');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerAd();

    musicPlay();
    _duration = 30;
    admobHelper.createInterad();

    player.onPlayerStateChanged.listen((State) {
      setState(() {
        isPlaying = State == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    player.onPlayerComplete.listen((event) {
      setState(() {
        isRepeat ? musicPlay() : player.stop();
        // player.setReleaseMode(ReleaseMode.loop);
      });
    });
  }

  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-4761502052861398/4023717281',
      // adUnitId: Platform.isAndroid
      //     ? 'ca-app-pub-3940256099942544/6300978111'
      //     : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print(error);
      }, onAdLoaded: (ad) {
        setState(() {
          isAdLoaded = true;
        });
      }),
      request: const AdRequest(),
    );

    bannerAd.load();
  }

  musicPlay() {
    setState(() {
      player.play(AssetSource(widget.musicModel.music!));
    });
  }

  // replay music

  // void loop() {
  //   player.setReleaseMode(ReleaseMode.loop);
  // }

  backButton() {
    setState(() {
      player.stop();
      Get.back();
      admobHelper.showInterad();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(widget.musicModel.image!), fit: BoxFit.cover),
      ),
      child: WillPopScope(
        onWillPop: () async => backButton(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          player.stop();
                          Get.back();
                          admobHelper.showInterad();
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      CustomText(
                        text: widget.musicModel.name!,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 50)
                    ]),
                const SizedBox(height: 20),
                controller == null
                    ? Container()
                    : Container(
                        color: Colors.black38,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CountdownTimer(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                            controller: controller,
                          ),
                        ),
                      ),
                // InkWell(
                //   onTap: () {
                //     // _controller.reset();
                //     // player.stop();
                //   },
                //   child: CircularCountDownTimer(
                //     // Countdown duration in Seconds.
                //     duration: _duration,

                //     // Countdown initial elapsed Duration in Seconds.
                //     initialDuration: 0,

                //     // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                //     controller: _controller,

                //     // Width of the Countdown Widget.
                //     width: MediaQuery.of(context).size.width / 3,

                //     // Height of the Countdown Widget.
                //     height: MediaQuery.of(context).size.height / 5,

                //     // Ring Color for Countdown Widget.
                //     ringColor: Colors.grey[300]!,

                //     // Ring Gradient for Countdown Widget.
                //     ringGradient: null,

                //     // Filling Color for Countdown Widget.
                //     fillColor: const Color.fromARGB(255, 92, 194, 238),

                //     // Filling Gradient for Countdown Widget.
                //     fillGradient: null,

                //     // Background Color for Countdown Widget.
                //     backgroundColor: Colors.blue,

                //     // Background Gradient for Countdown Widget.
                //     backgroundGradient: null,

                //     // Border Thickness of the Countdown Ring.
                //     strokeWidth: 20.0,

                //     // Begin and end contours with a flat edge and no extension.
                //     strokeCap: StrokeCap.butt,

                //     // Text Style for Countdown Text.
                //     textStyle: const TextStyle(
                //       fontSize: 33.0,
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold,
                //     ),

                //     textFormat: CountdownTextFormat.MM_SS,

                //     // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                //     isReverse: true,

                //     // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                //     isReverseAnimation: true,

                //     // Handles visibility of the Countdown Text.
                //     isTimerTextShown: true,

                //     // Handles the timer start.
                //     autoStart: false,

                //     // This Callback will execute when the Countdown Starts.
                //     onStart: () {
                //       // Here, do whatever you want
                //       debugPrint('Countdown Started');
                //     },

                //     // This Callback will execute when the Countdown Ends.
                //     onComplete: () {
                //       // Here, do whatever you want
                //       player.stop();
                //       debugPrint('Countdown Ended');
                //     },

                //     // This Callback will execute when the Countdown Changes.
                //     onChange: (String timeStamp) {
                //       // Here, do whatever you want
                //       debugPrint('Countdown Changed $timeStamp');
                //     },

                //     timeFormatterFunction:
                //         (defaultFormatterFunction, duration) {
                //       if (duration.inSeconds == 0) {
                //         return "Stop";
                //       } else {
                //         return Function.apply(
                //             defaultFormatterFunction, [duration]);
                //       }
                //     },
                //   ),
                // ),

                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        iconSize: 40,
                        color: Colors.white,
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        onPressed: () async {
                          if (isPlaying) {
                            await player.pause();
                            _controller.pause();
                            print('Music paused');
                          } else {
                            print('Music Play');
                            _controller.resume();
                            await player
                                .play(AssetSource(widget.musicModel.music!));
                          }
                        },
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        iconSize: 40,
                        color: Colors.white,
                        icon: const Icon(Icons.timer),
                        onPressed: () {
                          _showDialog(context);
                          print('Stop button Tapped');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white54,
                  child: Slider(
                    inactiveColor: Colors.white,
                    activeColor: Colors.blue,
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (Value) async {
                      final position = Duration(seconds: Value.toInt());
                      await player.seek(position);
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                  color: Colors.white54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(position.inSeconds),
                        // style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        formatTime((duration - position).inSeconds),
                        // style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: isAdLoaded
                      ? SizedBox(
                          height: bannerAd.size.height.toDouble(),
                          width: bannerAd.size.width.toDouble(),
                          child: AdWidget(ad: bannerAd),
                        )
                      : Container(),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomText(
            text: 'Select Time Duration',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          content: TimeDuration(
            onChange: (val) {
              if (val != null) {
                setState(() {
                  _duration = val;
                });
                print('time selected$_duration');
              }
            },
          ),
          actions: <Widget>[
            _button(
                title: "Confirm",
                onPressed: () {
                  // setState(() {
                  //   _duration = int.parse(timeController.text);
                  // });

                  print("$_duration+++");
                  Get.back();
                  setState(() {
                    isRepeat = true;
                  });
                  setState(() {
                    controller = CountdownTimerController(
                        endTime: DateTime.now().millisecondsSinceEpoch +
                            1000 * _duration,
                        onEnd: () {
                          player.stop();
                          isRepeat = false;
                          // admobHelper.showInterad();
                        });
                  });

                  _controller.start();
                }),
          ],
        );
      },
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
