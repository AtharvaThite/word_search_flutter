import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'grid_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  late int m;
  late int n;
  TextEditingController RowController = TextEditingController();
  TextEditingController ColumnController = TextEditingController();

  //Text Field Validation
  void _onPressed() {
    String row = RowController.text;
    String column = ColumnController.text;

    if (row.isEmpty || column.isEmpty) {
      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in both fields.')),
      );
    } else {
      // Navigate to a different page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GridScreen(
            row: m,
            column: n,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    RowController.dispose();
    ColumnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Create your GRID',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Enter the Number of Rows',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextFormField(
                    controller: RowController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      m = int.parse(value);
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Enter the Number of Columns',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextFormField(
                    controller: ColumnController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      n = int.parse(value);
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
                    onPressed: _onPressed,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
