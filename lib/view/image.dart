import 'package:flutter/material.dart';
import 'package:get_image_cache_network/get_image_cache_network.dart';

class MyImage extends StatefulWidget {
  const MyImage({super.key});

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: GetImageCacheNetwork(
            imageFromNetworkUrl:
                'https://user-images.githubusercontent.com/54634181/179444759-11f2f480-11e7-4ece-9727-32bb6463d934.gif', // Image from the network
            imageFromAssetsUrl:
                'assets/stars.jpg', // Image for your placeholder image
            width: MediaQuery.of(context).size.width *
                0.5, // Optional width by default 64
            height: MediaQuery.of(context).size.width *
                0.5, // Optional height by default 64
            errorWidth: MediaQuery.of(context).size.width *
                0.8, // Optional width by error widget
            errorHeight: MediaQuery.of(context).size.width *
                0.5, // Optional height by error widget
            showLogs: true, // Optional setting to show or hide log of request
            cacheDuration:
                10, // Optional duration of the file in cache 15 days by default
            loading: const CircularProgressIndicator(
                color: Colors
                    .blue), // Optional widget to do loading by default progress indicator with green color
          ),
        ),
      ),
    );
  }
}
