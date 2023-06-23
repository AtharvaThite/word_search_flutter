import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';
import 'word_search.dart';

class WordSearchScreen extends StatefulWidget {
  var alphabets;
  int m;
  int n;
  WordSearchScreen({required this.alphabets, required this.m, required this.n});

  @override
  State<WordSearchScreen> createState() => _WordSearchScreenState();
}

class _WordSearchScreenState extends State<WordSearchScreen> {
  late int m;
  late int n;
  late var alphabets;
  List<int> result = [];
  late String word;
  TextEditingController _controller = TextEditingController();

  void initState() {
    m = widget.m;
    n = widget.n;
    alphabets = widget.alphabets;
    super.initState();
  }

  void _onPressed() {
    String text = _controller.text;

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a WORD to search.')),
      );
    } else {
      setState(() {
        result = WordSearch(alphabets, word, m, n);
        print(result);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Container(
                child: Text(
                  'Word SeARch',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: m * n,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: n,
                  //childAspectRatio: 0.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: result.contains(index) ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 15,
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      alphabets[index - ((index / m).floor() * n)]
                          [(index / m).floor()],
                      style: TextStyle(fontSize: 32.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _onPressed,
                    style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _controller,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp('[a-z]')),
                      ],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                      decoration: InputDecoration(hintText: "Enter word"),
                      onChanged: (value) {
                        word = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => HomeScreen()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
              child: Text(
                "Reset",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
