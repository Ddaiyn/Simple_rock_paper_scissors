import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void showRobotReslut(){

    List<String> hands = ['グー','チョキ','パー'];
    hands.shuffle(); // 配列要素をランダムに並び替える
    String hand = hands.first; //最初の配列要素をhandに入れる

    Image image;
    if (hand == 'グー') {
      image = Image.asset('images/janken_gu.png');
    } else if (hand == 'チョキ') {
      image = Image.asset('images/janken_choki.png');
    } else {
      image = Image.asset('images/janken_pa.png');
    }
    ;

    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('相手の手'),
        content: image,
      );
    },);
  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            backgroundColor: Colors.blue,
            padding: EdgeInsets.all(16),
          ),
          onPressed: () {
            showRobotReslut();
          },
          child: const Text(
            'ジャンケン',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
