import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String? appVersion;

  Future<void> infoVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  void initState() {
    infoVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Iconsax.arrow_left_1,
            color: Colors.white,
            size: 20,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        title: Text(
          'about'.tr,
          style: context.theme.primaryTextTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 20, 19, 26),
                  ),
                  child: Image.asset(
                    'assets/icons/life_lately.png',
                    scale: 5,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'LifeLately',
                  style: context.theme.primaryTextTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'v1.0.0',
                  style: context.theme.primaryTextTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                // SizedBox(
                //   width: 320,
                //   child: Text(
                //     'aboutDesc'.tr,
                //     style: context.theme.primaryTextTheme.labelLarge?.copyWith(
                //       height: 1.3,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.white,
                //       fontSize: 16,
                //     ),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                // MaterialButton(
                //   highlightColor: Colors.transparent,
                //   onPressed: () async {
                //     final Uri url =
                //         Uri.parse('https://github.com/varunkumarmedam/todark');

                //     if (!await launchUrl(url,
                //         mode: LaunchMode.externalApplication)) {
                //       throw Exception('Could not launch $url');
                //     }
                //   },
                //   child: Text(
                //     'GitHub',
                //     style: context.theme.primaryTextTheme.titleLarge?.copyWith(
                //       fontWeight: FontWeight.w600,
                //       color: Colors.cyan,
                //       fontSize: 28,
                //     ),
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 30, 5, 20),
              child: Text(
                '${'author'.tr} Sravani Sparkzz',
                style: context.theme.primaryTextTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
