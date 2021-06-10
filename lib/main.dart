import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'NotoSans',
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final PageController controller = PageController(initialPage: 0);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),

        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //
        //         decoration: BoxDecoration(
        //           color: white,
        //           border: Border(bottom: BorderSide(color: borderGrey, width: 1))
        //
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 11,
        //       child: PageView(
        //         scrollDirection: Axis.horizontal,
        //         controller: controller,
        //         children: const <Widget>[
        //           Center(
        //             child: Text('First Page'),
        //           ),
        //           Center(
        //             child: Text('Second Page'),
        //           ),
        //           Center(
        //             child: Text('Third Page'),
        //           ),
        //           Center(
        //             child: Text('Fourth Page'),
        //           ),
        //           Center(
        //             child: Text('Fifth Page'),
        //           )
        //         ],
        //       )
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color:whiteGrey,
        //           border: Border(top: BorderSide(width: 1, color: borderGrey))
        //         ),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Column(children: [Icon(Icons.home_filled, color: darkGrey,),SizedBox(height: 2,),Text('Home',style: TextStyle(fontSize: 10),)],)
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
      )

    );
  }
}
