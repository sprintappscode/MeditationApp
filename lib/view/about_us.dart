import 'package:flutter/material.dart';
import 'package:meditation_app/custom_widgets/custom_text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 40,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text('About US'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
              height: 130,
              width: 130,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/app_icon.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomText(text: 'Version 1.2'),
            const SizedBox(height: 30),
            CustomText(text: '@2023 Soul Meditation'),
            const SizedBox(height: 30),
            CustomText(text: 'Developed By:'),
            const SizedBox(
              height: 130,
              width: 180,
              child: Image(image: AssetImage('assets/company_logo.png')),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
