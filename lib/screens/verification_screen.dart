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

  // 🔥 Updated buildKey with letters support
  Widget buildKey(String number, {String? letters, VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (letters != null)
                Text(
                  letters,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // 👇 Underlines hamesha grey hi rahengi
  Widget buildCodeLine(int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  code[index],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              color: Colors.black26, // 👈 grey underline fix
            ),
          ],
        ),
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
                          Navigator.pop(context);
                        },
                      ),
                      const Spacer(),
                      const Text(
                        "Verification Code",
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
                  const SizedBox(height: 20),
                  const Text(
                    "Please Enter the 6-digit code sent to",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "youremail@gmail.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) => buildCodeLine(index)),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
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

          // 🔥 Updated Keyboard
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // 👈 top se start
                children: [
                  Row(
                    children: [
                      buildKey('1', onTap: () => _onKeyboardTap('1')),
                      buildKey(
                        '2',
                        letters: "ABC",
                        onTap: () => _onKeyboardTap('2'),
                      ),
                      buildKey(
                        '3',
                        letters: "DEF",
                        onTap: () => _onKeyboardTap('3'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      buildKey(
                        '4',
                        letters: "GHI",
                        onTap: () => _onKeyboardTap('4'),
                      ),
                      buildKey(
                        '5',
                        letters: "JKL",
                        onTap: () => _onKeyboardTap('5'),
                      ),
                      buildKey(
                        '6',
                        letters: "MNO",
                        onTap: () => _onKeyboardTap('6'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      buildKey(
                        '7',
                        letters: "PQRS",
                        onTap: () => _onKeyboardTap('7'),
                      ),
                      buildKey(
                        '8',
                        letters: "TUV",
                        onTap: () => _onKeyboardTap('8'),
                      ),
                      buildKey(
                        '9',
                        letters: "XYZ",
                        onTap: () => _onKeyboardTap('9'),
                      ),
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
          ),
        ],
      ),
    );
  }
}
