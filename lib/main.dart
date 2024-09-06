import 'package:flutter/material.dart';

import 'Repository/Api/apis.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'HTTP sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

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

final _numberInputController = TextEditingController();
String _resultText = 'Type Number and Enter get result';

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _numberInputController,
              decoration: const InputDecoration(
                hintText: 'Enter Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 50,),
            Text(_resultText),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ElevatedButton(
          onPressed: () async {
            final _number = _numberInputController.text;
            final _result = await getNumberFact(number: _number);

            setState(() {
              _resultText = _result.text ?? 'No trivia text found';
            });

            print(_result.text);
          },
          style:  const ButtonStyle(elevation: WidgetStatePropertyAll(5),minimumSize: WidgetStatePropertyAll(Size.fromHeight(45))),
          child: const Text('Get Result', style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),


      // FloatingActionButton(
      //   onPressed: () {
      //
      //   },
      //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //   tooltip: 'Increment',
      //   child: const Text('Icons.add'),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
