import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool isMobile = width < 800;

    return Container(
      height: double.infinity,
      color: Color.fromARGB(255, 208, 208, 208),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 15 : 30,
            vertical: 30,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Projects",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 26 : 40,

                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              /// PROJECT 1
              ProjectCard(
                isMobile: isMobile,

                image: "assets/images/portfolio.png",
                title: "Portfolio App",
                description: "My personal Flutter portfolio.",
              ),

              const SizedBox(height: 25),

              /// PROJECT 2
              ProjectCard(
                isMobile: isMobile,

                image: "assets/images/food.png",

                title: "Food Delivery App",

                description: "A modern food delivery UI built with Flutter.",
              ),

              const SizedBox(height: 25),

              /// PROJECT 3
              ProjectCard(
                isMobile: isMobile,

                image: "assets/images/ecommerce.png",

                title: "E-commerce App",

                description: "Shopping app UI in Flutter.",
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

  final bool isMobile;

  const ProjectCard({
    super.key,

    required this.image,

    required this.title,

    required this.description,

    required this.isMobile,
  });

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
                  Text(
                    title,

                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 18 : 22,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    description,

                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 13 : 15,

                      color: Colors.grey.shade400,

                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Wrap(
                    spacing: 10,

                    runSpacing: 10,

                    children: [
                      ElevatedButton(
                        onPressed: () {},

                        child: const Text("GitHub"),
                      ),

                      OutlinedButton(
                        onPressed: () {},

                        child: const Text("apk"),
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
