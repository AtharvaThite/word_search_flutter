// Implement an application which works as follows
//
// 1. Splash Screen
// 2. enter numbers m & n which indirectly indicates m rows and n column of a 2D grid.
// 3. the user should enter alphabets such that one alphabet occupies one position in the grid. Here we will need m*n number of alphabets.
// 4. grid creation done
// 5. Display the grid. Now The user can provide a text which needs to be searched in the grid.
// 6. If the text is available in the grid, then those alphabets should be highlighted if the text in the grid is readable in left to right direction (east), or top to bottom direction (south) or diagonal (south-east).
// 7. User can change the text provided in step 5 and check for the occurrence of the word in the grid.
//
// Note -
// 1. At anytime, the user should be able to reset the setup and the application starts again from step 2.
// 2. APK and the Source code should be shared via dropbox, google drive etc... to hr@mobigic.com

import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
