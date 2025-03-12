import 'dart:async';
import 'dart:math';

import 'package:ecole_it_demo/view/widgets/eight_mark.dart';
import 'package:flutter/material.dart';
import 'package:shake_gesture/shake_gesture.dart';

class MagicCard extends StatefulWidget {
  const MagicCard({
    super.key,
    required this.possibleAnswers,
    required this.shouldReset,
  });

  final List<String> possibleAnswers;
  final bool shouldReset;

  @override
  State<MagicCard> createState() => _MagicCardState();
}

class _MagicCardState extends State<MagicCard> {
  String answer = '';
  Timer? timer;
  bool isShuffling = false;

  void _shuffle() {
    if (answer.isNotEmpty && widget.shouldReset) {
      setState(() {
        isShuffling = true;
      });
      timer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          isShuffling = false;
          answer = '';
        });
      });
    } else {
      setState(() {
        isShuffling = true;
      });
      timer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          isShuffling = false;
          answer =
              widget.possibleAnswers[Random().nextInt(
                widget.possibleAnswers.length,
              )];
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShakeGesture(
      onShake: _shuffle,
      child: GestureDetector(
        onTap: _shuffle,
        child: AnimatedRotation(
          turns: isShuffling ? 0 : -0.05,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
          child: Card(
            elevation: 5.0,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(64.0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const EightMark(),
                ),
                answer.isEmpty
                    ? const CustomText('Shake to reveal your fortune...')
                    : CustomText(answer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
        fontFamily: 'Montserrat',
      ),
    );
  }
}
