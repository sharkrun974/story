import 'package:flutter/material.dart';
import 'storyBrain.dart';

StoryBrain sb = StoryBrain();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: MyStory()),
      ),
    ),
  );
}

class MyStory extends StatefulWidget {
  const MyStory({Key? key}) : super(key: key);

  @override
  _MyStoryState createState() => _MyStoryState();
}

class _MyStoryState extends State<MyStory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: Text(
                sb.getStoryTitle(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow)),
              onPressed: () {
                setState(() {
                  sb.nextStory(1);
                });
              },
              child: Text(
                sb.getStoryChoice1(),
                style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Visibility(
              visible: sb.buttonVisible(),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  setState(() {
                    sb.nextStory(2);
                  });
                },
                child: Text(
                  sb.getStoryChoice2(),
                  style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
