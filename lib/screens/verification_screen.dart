import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // 👈 ye line add karni hai

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  List<String> code = ['', '', '', '', '', ''];
  int currentIndex = 0;

  void _onKeyboardTap(String value) {
    setState(() {
      if (currentIndex < 6) {
        code[currentIndex] = value;
        if (currentIndex < 5) currentIndex++;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (currentIndex > 0 && code[currentIndex] == '') {
        currentIndex--;
      }
      code[currentIndex] = '';
    });
  }

  bool get isCodeComplete => !code.contains('');

  Widget buildKey(String number, {VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCodeLine(int index) {
    bool isActive = currentIndex == index;
    bool isFilled = code[index].isNotEmpty;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 2,
        color: isActive || isFilled ? Colors.blue : Colors.black26,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          ); // 👈 back arrow pe previous screen
                        },
                      ),
                      const Spacer(),
                      const Text(
                        "Verification",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) => buildCodeLine(index)),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // 👇 Navigate to Welcome Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFECAAD),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: Color(0xFFFECAAD)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "By continuing you agree to our Terms and Privacy Policies",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            buildKey('1', onTap: () => _onKeyboardTap('1')),
                            buildKey('2', onTap: () => _onKeyboardTap('2')),
                            buildKey('3', onTap: () => _onKeyboardTap('3')),
                          ],
                        ),
                        Row(
                          children: [
                            buildKey('4', onTap: () => _onKeyboardTap('4')),
                            buildKey('5', onTap: () => _onKeyboardTap('5')),
                            buildKey('6', onTap: () => _onKeyboardTap('6')),
                          ],
                        ),
                        Row(
                          children: [
                            buildKey('7', onTap: () => _onKeyboardTap('7')),
                            buildKey('8', onTap: () => _onKeyboardTap('8')),
                            buildKey('9', onTap: () => _onKeyboardTap('9')),
                          ],
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            buildKey('0', onTap: () => _onKeyboardTap('0')),
                            Expanded(
                              child: InkWell(
                                onTap: _onBackspace,
                                child: const Icon(
                                  Icons.backspace,
                                  size: 28,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
