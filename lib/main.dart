import 'package:flutter/material.dart';
import 'package:adder/adder.dart';
import 'package:scrap/scrap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Scrap scrap = Scrap();
  Adder adder = Adder();

  @override
  void initState() {
    super.initState();
    Scrap.setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 100),
            TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                  onPressed: _incrementCounter,
                  child: const Text('Push me to call Rust function'),
                ),
                Text(
              'The function increments counter by 3',
            ),
            const SizedBox(height: 50),
                Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter = adder.add(_counter, 1);
    });
  }

  void _showWebPage() async {
    final html = await scrap.loadPage('https://www.rust-lang.org/');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (context) => SingleChildScrollView(
        child: Text(html),
      ),
    );
  }
}
