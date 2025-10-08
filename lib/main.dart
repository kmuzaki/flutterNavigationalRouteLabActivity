import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Lab',
      // home: FirstScreen(),
      initialRoute: '/first',
      routes: {
        '/first': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              //code for button's colour
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second', arguments: 'Hello, User! This is a message from the first screen.');
              },
              child: Text('Go to Second Screen'),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              child: Text(
                  "Pop until same screen",
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/first'));
              },
            ),

            SizedBox(height: 16),

            Text("Pop until the exact same screen won't do anything."),
          ],
        ),
        // child: FilledButton(
        //   //code for button's colour
        //   style: FilledButton.styleFrom(
        //     backgroundColor: Colors.green,
        //   ),
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/second');
        //   },
        //   child: Text('Go to Second Screen'),
        // ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                  "Go to Third Screen",
                  style: TextStyle(fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),

            SizedBox(height: 16),

            Text(
              args ?? "I'm sorry, but I got nothing",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        // child: ElevatedButton(
        //   child: Text(
        //       "Go to Third Screen",
        //       style: TextStyle(fontStyle: FontStyle.italic),
        //   ),
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/third');
        //   },
        // ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(
                  "This is the third screen. Oh hey, there! What's up? Press to go back home.",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/first'));
              },
            ),

            SizedBox(height: 16),

            ElevatedButton(
              child: Text(
                  "Go back to second screen",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/first');
              },
              child: Text(
                'Push Replacement to First Screen',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            ),
          ],
        )
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FirstScreen(),
//       routes: {
//         '/second': (context) => SecondScreen(),
//       },
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('First Screen')),
//       body: Center(
//         child: 
//           FilledButton(
//             //code for button's colour
//             style: FilledButton.styleFrom(
//               backgroundColor: Colors.green,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SecondScreen(),
//                 ),
//               );
//             },
//             child: Text('Go to Second Screen'),
//           ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(title: Text('Second Screen')),
//       body:
//       Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Go Back'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               "This is the second screen. Oh hey, there! What's up?",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//           ],
//         ),
//       )
//     );
//   }
// }
