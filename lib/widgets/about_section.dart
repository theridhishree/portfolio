import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  Future<void> downloadCV() async {
    final data = await rootBundle.load('assets/cv/resume.pdf');
    final bytes = data.buffer.asUint8List();
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/resume.pdf');
    await file.writeAsBytes(bytes);
    OpenFile.open(file.path);
  }

  Future<void> launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '7870899636');

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800;
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 208, 208, 208),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: isMobile
            ? Column(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/images/mypic.jpeg"),
                  ),
                  const SizedBox(height: 30),

                  aboutText(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: aboutText()),

                  const SizedBox(width: 50),
                  const CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                ],
              ),
      ),
    );
  }

  Widget aboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I'm ",
          style: GoogleFonts.poppins(fontSize: 22, color: Colors.black54),
        ),

        const SizedBox(height: 10),
        Text(
          "Ridhi Shree",
          style: GoogleFonts.poppins(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 15),
        Text(
          "Flutter Developer",
          style: GoogleFonts.poppins(
            fontSize: 28,
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),
        Text(
          "I build beautiful and responsive mobile and web",
          style: GoogleFonts.poppins(
            fontSize: 18,
            height: 1.6,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 30),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                await downloadCV();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text("Resume"),
            ),

            const SizedBox(width: 20),
            OutlinedButton(
              onPressed: () async {
                await launchPhone();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 18,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text("Contact Me"),
            ),
          ],
        ),
      ],
    );
  }
}
