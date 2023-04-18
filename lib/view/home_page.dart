import 'package:asset_cache/asset_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/custom_widgets/custom_text.dart';
import 'package:meditation_app/model/music_model.dart';
import 'package:meditation_app/view/interstitial_ad.dart';
import 'package:meditation_app/view/playScreen.dart';

import 'app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AdmobHelper admobHelper = AdmobHelper();
  final player = AudioPlayer();
  final imageCache = ImageAssetCache(basePath: "assets/");

  List<MusicModel> listAllMusic = [
    MusicModel(
      name: "Morning",
      image: "assets/morning.jpg",
      music: "a_morning.mp3",
    ),
    MusicModel(
      name: "River",
      image: "assets/river.jpg",
      music: "a_river.mp3",
    ),
    MusicModel(
      name: "Motivational",
      image: "assets/motivational.jpg",
      music: "a_motivational.mp3",
    ),
    MusicModel(
      name: "Peacful Night",
      image: "assets/peaceful night.jpg",
      music: "a_peacful.mp3",
    ),
    MusicModel(
      name: "Tree",
      image: "assets/tree.jpg",
      music: "a_tree.mp3",
    ),
    MusicModel(
      name: "Rain Fall",
      image: "assets/rain fall.jpg",
      music: "a_rain.mp3",
    ),
    MusicModel(
      name: "Dreamer",
      image: "assets/dreamer.jpg",
      music: "a_dreamer.mp3",
    ),
    MusicModel(
      name: "Peace",
      image: "assets/peace.jpg",
      music: "a_peace.mp3",
    ),
    MusicModel(
      name: "Soft Water",
      image: "assets/soft water.jpg",
      music: "a_water.mp3",
    ),
    MusicModel(
      name: "Alone Nature",
      image: "assets/alone nature.jpg",
      music: "a_alone.mp3",
    ),
    MusicModel(
      name: "Grass",
      image: "assets/grass.jpg",
      music: "a_grass.mp3",
    ),
    MusicModel(
      name: "Leave",
      image: "assets/leave.jpg",
      music: "a_leave.mp3",
    ),
    MusicModel(
      name: "Mid Night",
      image: "assets/mid night.jpeg",
      music: "a_mid.mp3",
    ),
    MusicModel(
      name: "Mountain",
      image: "assets/mountain.jpg",
      music: "a_mountain.mp3",
    ),
    MusicModel(
      name: "Star",
      image: "assets/stars.jpg",
      music: "a_star.mp3",
    ),
    MusicModel(
      name: "Peaceful Sea",
      image: "assets/peaceful sea.jpg",
      music: "a_sea.mp3",
    ),
    MusicModel(
      name: "Rainy",
      image: "assets/rainy.jpg",
      music: "a_rainy.mp3",
    ),
    MusicModel(
      name: "Sky",
      image: "assets/sky.jpg",
      music: "a_sky.mp3",
    ),
  ];

  // static List<String> musicName = [
  //   'Morning',
  //   'River',
  //   'Motivational',
  //   'Peacful Night',
  //   'Tree',
  //   'Rain Fall',
  //   'Dreamer',
  //   'Peace',
  //   'Soft Water',
  //   'Alone Nature',
  //   'Grass',
  //   'Leave',
  //   'Mid Night',
  //   'Mountain',
  //   'Star',
  //   'Peaceful Sea',
  //   'Rainy',
  //   'Sky',
  // ];

  // static List img = [
  //   'assets/morning.jpg',
  //   'assets/river.jpg',
  //   'assets/motivational.jpg',
  //   'assets/peaceful night.jpg',
  //   'assets/tree.jpg',
  //   'assets/rain fall.jpg',
  //   'assets/dreamer.jpg',
  //   'assets/peace.jpg',
  //   'assets/soft water.jpg',
  //   'assets/alone nature.jpg',
  //   'assets/grass.jpg',
  //   'assets/leave.jpg',
  //   'assets/mid night.jpeg',
  //   'assets/mountain.jpg',
  //   'assets/stars.jpg',
  //   'assets/peaceful sea.jpg',
  //   'assets/rainy.jpg',
  //   'assets/sky.jpg',
  // ];
  // static List music = [
  //   'a_morning.mp3',
  //   'a_river.mp3',
  //   'a_motivational.mp3',
  //   'a_peacful.mp3',
  //   'a_tree.mp3',
  //   'a_rain.mp3',
  //   'a_dreamer.mp3',
  //   'a_peace.mp3',
  //   'a_water.mp3',
  //   'a_alone.mp3',
  //   'a_grass.mp3',
  //   'a_leave.mp3',
  //   'a_mid.mp3',
  //   'a_mountain.mp3',
  //   'a_star.mp3',
  //   'a_sea.mp3',
  //   'a_rainy.mp3',
  //   'a_sky.mp3',
  // ];

  // final List<MusicModel> musicData = List.generate(
  //     listAllMusic.length,
  //     (index) => MusicModel(
  //           name: musicName[index],
  //           image: '${img[index]}',
  //           music: '${music[index]}',
  //         ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    admobHelper.createInterad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: CustomText(
          text: 'Meditation Music',
          fontSize: 22.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      drawer: const AppDrawer(),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.blue,
            content: CustomText(
              text: 'Double Tap to Close',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            )),
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              children: List.generate(
                // total number of music
                listAllMusic.length,
                (index) {
                  return adaptor(index, context);
                },
              )),
        ),
      ),
    );
  }

  InkWell adaptor(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        admobHelper.showInterad();
        // player.play(AssetSource(musicData[index].music!));
        Get.to(
          PlayScreen(
            musicModel: listAllMusic[index],
          ),
        );
      },
      child: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        listAllMusic[index].image!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
                const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                )
              ],
            ),
            CustomText(text: listAllMusic[index].name!),
          ],
        ),
      ),
    );
  }
}
