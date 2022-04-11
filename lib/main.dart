import 'package:flutter/material.dart';
import 'storybrain.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: const Text(
              'Choose Your Destiny......',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            centerTitle: true,
          ),
          body: const StoryPage()),
    ),
  );
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                storyBrain.getstory(),
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF110e0e),
              ),
              onPressed: () {
                setState(() {
                  storyBrain.nextstory(1);
                });
              },
              child: Text(
                storyBrain.getchoice1(),
                style: const TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Visibility(
              visible: storyBrain.buttonvisibility(),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF110e0e),
                ),
                onPressed: () {
                  setState(() {
                    storyBrain.nextstory(2);
                  });
                },
                child: Text(
                  storyBrain.getchoice2(),
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
