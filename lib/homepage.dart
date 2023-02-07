import 'package:flutter/material.dart';
import 'package:nic_tracker/validation.dart';
import 'resultsWidget.dart';

class MyHomePage extends StatefulWidget {
  static Color color = Colors.grey.shade300;
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _contraller = TextEditingController();
  String type = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyHomePage.color,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              'NIC Tracker',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            const Text('Insert your NIC No on below'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        _contraller.clear();
                      },
                      icon: const Icon(Icons.clear)),
                  hintText: 'Enter here',
                  border: const OutlineInputBorder(),
                ),
                controller: _contraller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 85, 81, 68)),
                    fixedSize: MaterialStateProperty.all(const Size(100, 50)),
                  ),
                  onPressed: () {
                    type = Validation(_contraller.text.trim()).checker();
                    setState(() {
                      MyHomePage.color = Colors.deepPurple;
                    });
                  },
                  child: const Text('FIND')),
            ),
            const SizedBox(height: 20),
            DisplayResults(
              type: type,
              controller: _contraller,
            ),
            const SizedBox(height: 200),
            const Text('@CreatedBySajith')
          ],
        ),
      ),
    );
  }
}
