import 'package:flutter/material.dart';
import 'gender_screen.dart'; // 👈 ye import karna na bhoolna

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image
            Image.asset(
              'assets/images/image.png', // <-- apna image path yahan dalna
              width: double.infinity,
              height: 250, // adjust height
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // Salaam text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Salaam and welcome to Muna",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            const SizedBox(height: 16),

            // "Looks like you're new here, youremail@gmail.com"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: "Looks like you’re new here, "),
                    TextSpan(
                      text: "youremail@gmail.com",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Bottom Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                "Tell us about yourself and Inshaallah we will show you great Muslims nearby",
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),

            // Button at bottom center
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6F61),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // 👇 Navigation to GenderScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GenderScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
