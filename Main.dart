import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(WhoPaysApp());
}

class WhoPaysApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhoPaysScreen(),
    );
  }
}

class WhoPaysScreen extends StatefulWidget {
  @override
  _WhoPaysScreenState createState() => _WhoPaysScreenState();
}

class _WhoPaysScreenState extends State<WhoPaysScreen> {
  final List<String> names = [];
  String? selectedName;

  void pickRandomName() {
    if (names.isNotEmpty) {
      final random = Random();
      setState(() {
        selectedName = names[random.nextInt(names.length)];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who Pays?'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Add a new name',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    names.add(value);
                  });
                }
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(names[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          names.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickRandomName,
              child: Text('Pick Someone Randomly'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
            ),
            if (selectedName != null) ...[
              SizedBox(height: 20),
              Text(
                '$selectedName will pay!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
