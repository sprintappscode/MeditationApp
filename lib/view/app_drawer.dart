import 'package:flutter/material.dart';
import 'package:meditation_app/custom_widgets/custom_text.dart';
import 'package:meditation_app/view/about_us.dart';
import 'package:meditation_app/view/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 40),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/appdrawer.jpeg'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 170,
              ),
              child: CustomText(
                text: 'SOUL MEDITATION',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            selected: true,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text("Contact Us"),
            onTap: () async {
              final uri = Uri.parse("https://sprintsols.com/contact-us/");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {}
            },
            selected: true,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About Us"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
            selected: true,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star_rate),
            title: const Text("Rate Us"),
            onTap: () async {
              final uri = Uri.parse(
                  "https://play.google.com/store/apps/details?id=com.meditationsounds.dailyrelax.music");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                // can't launch url
              }
            },
            selected: true,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
