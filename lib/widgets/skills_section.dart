import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    bool isMobile = width < 800;

    final List<Map<String, dynamic>> skills = [
      {"icon": Icons.phone_android, "title": "Flutter"},
      {"icon": Icons.code, "title": "Dart"},
      {"icon": Icons.local_fire_department, "title": "Firebase"},
      {"icon": Icons.api, "title": "API Integration"},
      {"icon": Icons.design_services, "title": "UI/UX"},
      {"icon": Icons.storage, "title": "MongoDB"},
      {"icon": Icons.code, "title": "C/C++"},
      {"icon": Icons.code, "title": "Java"},
      {"icon": Icons.web, "title": "HTML"},
      {"icon": Icons.web, "title": "CSS"},
    ];

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 208, 208, 208),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 15 : 30,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                itemCount: skills.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 2 : 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: isMobile ? 1 : 1.2,
                ),
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return Container(
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

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          skill["icon"],
                          size: isMobile ? 35 : 45,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          skill["title"],
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 15 : 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
