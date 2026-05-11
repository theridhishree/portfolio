import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificationSection extends StatelessWidget {
  const CertificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool isMobile = width < 800;

    final List<Map<String, String>> certificates = [
      {
        "title": "Flutter Development",
        "date": "2025-01-15",
        "image": "assets/certificates/ss1.jpg",
      },

      {
        "title": "Dart Programming",
        "date": "2024-12-10",
        "image": "assets/certificates/ss1.jpg",
      },

      {
        "title": "Firebase Essentials",
        "date": "2024-11-05",
        "image": "assets/certificates/ss1.jpg",
      },

      {
        "title": "UI/UX Design",
        "date": "2024-09-15",
        "image": "assets/certificates/ss1.jpg",
      },

      {
        "title": "Firebase Advanced",
        "date": "2024-08-10",
        "image": "assets/certificates/ss1.jpg",
      },

      {
        "title": "Flutter Web",
        "date": "2024-07-05",
        "image": "assets/certificates/ss1.jpg",
      },
    ];

    return Container(
      width: double.infinity,

      color: const Color.fromARGB(255, 208, 208, 208),

      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 25),

            /// CARDS
            isMobile
                ? Column(
                    children: certificates.map((cert) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),

                        child: certificateCard(context, cert),
                      );
                    }).toList(),
                  )
                : Wrap(
                    spacing: 25,

                    runSpacing: 25,

                    children: certificates.map((cert) {
                      return SizedBox(
                        width: 350,

                        child: certificateCard(context, cert),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }

  /// CERTIFICATE CARD
  Widget certificateCard(BuildContext context, Map<String, String> cert) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,

            blurRadius: 10,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          /// ICON
          Icon(Icons.workspace_premium, size: 32, color: Colors.orange),

          const SizedBox(width: 15),

          /// TEXTS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /// TITLE + EYE ICON
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        cert["title"]!,

                        style: GoogleFonts.poppins(
                          fontSize: 16,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    /// EYE ICON
                    InkWell(
                      onTap: () {
                        /// POPUP IMAGE
                        showDialog(
                          context: context,

                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),

                                child: Image.asset(
                                  cert["image"]!,

                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },

                      child: const Icon(
                        Icons.visibility_outlined,

                        color: Colors.blue,

                        size: 24,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                /// DATE
                Text(
                  cert["date"]!,

                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
