import 'package:flutter/material.dart';
import 'screens/sign_up_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  void _navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/couple.png",
            ), // background image path
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Logo + Text
              Column(
                children: [
                  const SizedBox(height: 80),
                  const Image(
                    image: AssetImage(
                      "assets/images/heart.png",
                    ), // top logo path
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Muna Match",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Buttons Section
              Column(
                children: [
                  // Continue with Apple
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: const Size(double.infinity, 55),
                      ),
                      icon: const Image(
                        image: AssetImage(
                          "assets/images/Apple.png",
                        ), // apple logo path
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        _navigateToSignUp(context);
                      },
                      label: const Text(
                        "Continue with Apple",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  // Continue with Google
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: const Size(double.infinity, 55),
                      ),
                      icon: const Image(
                        image: AssetImage(
                          "assets/images/Google.png",
                        ), // google logo path
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {
                        _navigateToSignUp(context);
                      },
                      label: const Text(
                        "Continue with Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Continue with Email (Clickable Text)
                  GestureDetector(
                    onTap: () {
                      _navigateToSignUp(context);
                    },
                    child: const Text(
                      "Continue with email",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline, // optional
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),

              // Bottom Text
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "By continuing you agree to our Terms and Privacy Policy",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
