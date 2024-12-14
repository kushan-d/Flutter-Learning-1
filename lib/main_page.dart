import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;

  late double bmi = calculateBMI(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(60),
        color: Colors.white,
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.male, size: 150),
                      Text("Male"),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.female, size: 200),
                      Text("Female"),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Height"),
                      Text("$height",
                          style: const TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 100,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                height--;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 60,
                            ),
                          ),
                          const SizedBox(width: 20),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                height++;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 60,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Weight"),
                      Text("$weight",
                          style: const TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 100,
                              fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 60,
                            ),
                          ),
                          const SizedBox(width: 20),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                                bmi = calculateBMI(
                                    height: height, weight: weight);
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 60,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Text(
                  bmi.toStringAsFixed(2),
                  style: const TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(getResult(bmi))
              ],
            )
          ],
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 1000;
  }

  String getResult(bmi) {
    if (bmi >= 25) {
      return ("overweight");
    } else if (bmi > 18.5) {
      return ("Normal");
    } else {
      return ("underweight");
    }
  }
}
