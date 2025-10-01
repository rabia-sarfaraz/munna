import 'package:flutter/material.dart';
import 'bday_screen.dart'; // ✅ Import your BdayScreen file

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  bool isCaps = false; // caps lock state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Bigger Image on top
            Image.asset(
              "assets/images/user.png", // your image path
              height: 260, // slightly bigger
              width: 260,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            // What's your name? text
            const Text(
              "What’s your name?",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // First Name Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "First Name",
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
            ),

            const SizedBox(height: 40),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFECAAD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // ✅ Navigate to BdayScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BdayScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Custom Keyboard
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildKeyboardRow([
                    "q",
                    "w",
                    "e",
                    "r",
                    "t",
                    "y",
                    "u",
                    "i",
                    "o",
                    "p",
                  ]),
                  _buildKeyboardRow([
                    "a",
                    "s",
                    "d",
                    "f",
                    "g",
                    "h",
                    "j",
                    "k",
                    "l",
                  ]),
                  _buildKeyboardRowWithCaps([
                    "z",
                    "x",
                    "c",
                    "v",
                    "b",
                    "n",
                    "m",
                  ]),
                  _buildBottomRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: keys.map((key) {
          return _buildKey(isCaps ? key.toUpperCase() : key);
        }).toList(),
      ),
    );
  }

  Widget _buildKeyboardRowWithCaps(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: _keyStyle(),
            onPressed: () {
              setState(() {
                isCaps = !isCaps;
              });
            },
            child: const Icon(Icons.arrow_upward, color: Colors.black),
          ),

          ...keys.map((key) => _buildKey(isCaps ? key.toUpperCase() : key)),

          ElevatedButton(
            style: _keyStyle(),
            onPressed: () {},
            child: const Icon(Icons.backspace_outlined, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.black,
              size: 28,
            ),
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildKey("123"),
                _buildKey("space", flex: 4),
                _buildKey("return", flex: 2),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.keyboard_voice_outlined,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        child: ElevatedButton(
          style: _keyStyle(),
          onPressed: () {},
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle _keyStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      minimumSize: const Size(40, 50),
      padding: EdgeInsets.zero,
    );
  }
}
