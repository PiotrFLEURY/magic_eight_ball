import 'dart:async';
import 'dart:math';

import 'package:ecole_it_demo/view/widgets/answer.dart';
import 'package:ecole_it_demo/view/widgets/eight_mark.dart';
import 'package:flutter/material.dart';
import 'package:shake_gesture/shake_gesture.dart';

class Ball extends StatefulWidget {
  const Ball({
    super.key,
    required this.possibleAnswers,
    required this.shouldReset,
  });

  final List<String> possibleAnswers;
  final bool shouldReset;

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  String answer = '';
  Timer? timer;
  bool isShuffling = false;

  void _shuffle() {
    if (answer.isNotEmpty && widget.shouldReset) {
      setState(() {
        isShuffling = true;
      });
      timer = Timer(const Duration(milliseconds: 600), () {
        setState(() {
          isShuffling = false;
          answer = '';
        });
      });
    } else {
      setState(() {
        isShuffling = true;
      });
      timer = Timer(const Duration(milliseconds: 600), () {
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
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ShakeGesture(
      onShake: _shuffle,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            gradient: RadialGradient(
              colors: [
                Colors.grey[400]!,
                Colors.grey[600]!,
                Colors.black,
                Colors.grey[900]!,
              ],
              stops: [0.0, 0.2, 0.5, 0.7],
              center: Alignment(0, -0.3),
              radius: 0.8,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(96.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                gradient: RadialGradient(
                  colors: [Colors.grey, Colors.black, Colors.grey[900]!],
                  stops: [0.0, 0.5, 1],
                  center: Alignment(0, -0.3),
                  radius: 1,
                ),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: _shuffle,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: isShuffling ? 0.0 : 1.0,
                    child: AnimatedSlide(
                      duration: const Duration(milliseconds: 500),
                      offset:
                          isShuffling
                              ? const Offset(0, 0.1)
                              : const Offset(0, 0),
                      curve: Curves.decelerate,
                      child:
                          answer.isEmpty ? EightMark() : Answer(text: answer),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
