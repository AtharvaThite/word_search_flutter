import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'word_search_screen.dart';

class GridScreen extends StatefulWidget {
  final int row;
  final int column;
  GridScreen({super.key, required this.row, required this.column});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  late int m;
  late int n;
  late var alphabets;

  void initState() {
    m = widget.row;
    n = widget.column;
    alphabets = List.generate(m, (i) => List.filled(n, "", growable: false),
        growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Enter Alphabets',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 500,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: m * n,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: n,
                      //childAspectRatio: 0.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => TextFormField(
                      maxLength: 1,
                      keyboardType: TextInputType.text,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[a-z]')),
                      ],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      initialValue: alphabets[index - ((index / m).floor() * m)]
                          [(index / m).floor()],
                      onChanged: (value) {
                        alphabets[index - ((index / m).floor() * m)]
                            [(index / m).floor()] = value;
                        print(alphabets);
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => WordSearchScreen(
                              alphabets: alphabets,
                              m: m,
                              n: n,
                            )),
                      ),
                    );
                  },
                  child: Text(
                    'Confirm',
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
    );
  }
}
