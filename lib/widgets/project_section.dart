import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool isMobile = width < 800;

    return Container(
      height: double.infinity,
      color: const Color.fromARGB(255, 208, 208, 208),

      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 15 : 30,
            vertical: 30,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 25),

              /// PROJECT 1
              ProjectCard(
                isMobile: isMobile,

                image: "assets/images/portfolio.png",

                title: "Portfolio App",

                description: "My personal Flutter portfolio.",

                githubUrl: "https://github.com/theridhishree/portfolio",

                apkUrl:
                    "https://github.com/theridhishree/portfolio/releases/download/v1/app-release.apk",
              ),

              const SizedBox(height: 25),

              /// PROJECT 2
              ProjectCard(
                isMobile: isMobile,

                image: "assets/images/food.png",

                title: "Food Delivery App",

                description: "A modern food delivery UI built with Flutter.",

                githubUrl: "https://github.com/theridhishree/fooddelivery",

                apkUrl:
                    "https://github.com/theridhishree/fooddelivery/releases/download/v1/app-release.apk",
              ),

              const SizedBox(height: 25),

              /// PROJECT 3
              ProjectCard(
                isMobile: isMobile,

                image: "assets/images/ecommerce.png",

                title: "E-commerce App",

                description: "Shopping app UI in Flutter.",

                githubUrl: "https://github.com/theridhishree/ecommerce",

                apkUrl:
                    "https://github.com/theridhishree/EcommerceApp/releases/download/v1.0.0/app-release.apk",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String image;

  final String title;

  final String description;

  final String githubUrl;

  final String apkUrl;

  final bool isMobile;

  const ProjectCard({
    super.key,

    required this.image,

    required this.title,

    required this.description,

    required this.githubUrl,

    required this.apkUrl,

    required this.isMobile,
  });

  /// OPEN GITHUB
  Future<void> openGithub() async {
    final Uri url = Uri.parse(githubUrl);

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  /// DOWNLOAD APK
  Future<void> downloadApk() async {
    final Uri url = Uri.parse(apkUrl);

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.grey,

            blurRadius: 8,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(15),

              child: Image.asset(
                image,

                height: isMobile ? 90 : 120,

                width: isMobile ? 90 : 120,

                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 15),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// TITLE
                  Text(
                    title,

                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 18 : 22,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// DESCRIPTION
                  Text(
                    description,

                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 13 : 15,

                      color: Colors.grey.shade400,

                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// BUTTONS
                  Wrap(
                    spacing: 10,

                    runSpacing: 10,

                    children: [
                      /// GITHUB BUTTON
                      ElevatedButton(
                        onPressed: () async {
                          await openGithub();
                        },

                        child: const Text("GitHub"),
                      ),

                      /// APK BUTTON
                      OutlinedButton(
                        onPressed: () async {
                          await downloadApk();
                        },

                        child: const Text("APK"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
