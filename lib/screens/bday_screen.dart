import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BdayScreen extends StatefulWidget {
  const BdayScreen({super.key});

  @override
  State<BdayScreen> createState() => _BdayScreenState();
}

class _BdayScreenState extends State<BdayScreen> {
  int selectedDay = 1;
  String selectedMonth = 'January';
  int selectedYear = DateTime.now().year;

  final List<int> days = List.generate(31, (index) => index + 1);
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final List<int> years = List.generate(
    50,
    (index) => DateTime.now().year - index,
  );

  int calculateAge() {
    DateTime today = DateTime.now();
    DateTime birthday = DateTime(
      selectedYear,
      months.indexOf(selectedMonth) + 1,
      selectedDay,
    );
    int age = today.year - birthday.year;
    if (today.month < birthday.month ||
        (today.month == birthday.month && today.day < birthday.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    final age = calculateAge();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Top Image (Bigger now)
            Center(
              child: Image.asset(
                "assets/images/user1.png",
                height: 350, // bigger size
                width: 350,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            // Caption
            const Center(
              child: Text(
                "When were you born?",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),

            // Pickers
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: days.indexOf(selectedDay),
                      ),
                      itemExtent: 40,
                      selectionOverlay: Container(
                        color: const Color(0xFFFF6F61).withOpacity(0.9),
                      ),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedDay = days[index];
                        });
                      },
                      children: days
                          .map(
                            (d) => Center(
                              child: Text(
                                d.toString(),
                                style: TextStyle(
                                  color: d == selectedDay
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: months.indexOf(selectedMonth),
                      ),
                      itemExtent: 40,
                      selectionOverlay: Container(
                        color: const Color(0xFFFF6F61).withOpacity(0.9),
                      ),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedMonth = months[index];
                        });
                      },
                      children: months
                          .map(
                            (m) => Center(
                              child: Text(
                                m,
                                style: TextStyle(
                                  color: m == selectedMonth
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: 0,
                      ),
                      itemExtent: 40,
                      selectionOverlay: Container(
                        color: const Color(0xFFFF6F61).withOpacity(0.9),
                      ),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedYear = years[index];
                        });
                      },
                      children: years
                          .map(
                            (y) => Center(
                              child: Text(
                                y.toString(),
                                style: TextStyle(
                                  color: y == selectedYear
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Age text
            Text(
              'You are $age years old',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Continue Button
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6F61),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigation will go here
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
