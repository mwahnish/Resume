import 'package:flutter/material.dart';
import 'package:wahnish_resume/about.dart';
import 'package:wahnish_resume/link_item.dart';
import 'package:wahnish_resume/project_widget.dart';
import 'package:wahnish_resume/split_layout.dart';
import 'package:wahnish_resume/timeline/timeline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplitLayout(
        leftChild: About(
          name: "Mark Wahnish",
          tagline: "Software developer, game programmer, and generalist specializing in Unity",
          image: "assets/mark_wahnish.jpg",
          location: "Port St. Lucie, FL",
          email: "mark@abxygames.com",
          phone: "Available upon request",
          website: "https://markwahnish.com",
          about: "I am a Unity programmer focused on creating highly engaging, unique, and performant experiences, specializing in VR. I have a wide range of knowledge and skills, from game programming and design to 3D modeling of assets, texturing workflows, editor tool development, and even mechanical design and engineering. I'm currently open for freelance and consulting work! If you'd like to work together, drop me a line!"),
        rightChild: Timeline(
          sections: [
            TimelineSection(
              title: "Portfolio", 
              items: [
                ProjectWidget.withVideo(
                  name: "Decommissioned",
                  description: "VR space station exploration tech demo",
                  video: "https://www.youtube.com/embed/9begssws8D8?playlist=9begssws8D8&iv_load_policy=3&enablejsapi=1&disablekb=1&autoplay=1&controls=0&mute=1&showinfo=0&rel=0&loop=1&wmode=transparent&origin=http%3A%2F%2Flocalhost&widgetid=1",
                  roles: "Solo engineer, artist, and designer",
                  keySkills: "Software / gameplay engineering, performance analysis and mitigation, 3D art, unwrapping, and texturing",
                ),
                ProjectWidget.withImage(
                  name: "thInk",
                  description: "Mobile puzzle game for kids",
                  roles: "Technical artist, gameplay programmer",
                  keySkills: "Software / gameplay engineering, shader development, UI implementation",
                  image: "assets/thINK.png",
                  links: [
                    Link(title: "Itch.io", url: "https://bill9393.itch.io/think"),
                  ],

                )
              ]
            ),
            TimelineSection(
              title: "Work experience", 
              items: [
                Text("Hello world")
              ]
            ),
            TimelineSection(
              title: "Skills", 
              items: [
                Text("Hello world")
              ]
            )
          ]
        )
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
