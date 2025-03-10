
import 'package:ecole_it_demo/view/widgets/ball.dart';
import 'package:flutter/material.dart';

const evasiveAnswers = [
  "Essaye plus tard",
  "Essaye encore",
  "Pas d'avis",
  "C'est ton destin",
  "Le sort en est jeté",
  "Une chance sur deux",
  "Repose ta question",
];

const positiveAnswers = [
  "D'après moi oui",
  "C'est certain",
  "Oui absolument",
  "Tu peux compter dessus",
  "Sans aucun doute",
  "Très probable",
  "Oui",
  "C'est bien parti",
];

const negativeAnswers = [
  "C'est non",
  "Peu probable",
  "Faut pas rêver",
  "N'y compte pas",
  "Impossible",
];

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  bool resetBall = false;
  List<String> possibleAnswers = [];
  late TextEditingController answerController;

  void _toggleReset() {
    setState(() {
      resetBall = !resetBall;
    });
  }

  @override
  void initState() {
    super.initState();
    possibleAnswers = [
      ...positiveAnswers,
      ...negativeAnswers,
      ...evasiveAnswers,
    ];
    answerController = TextEditingController(text: possibleAnswers.join('\n'));
  }

  void _changeAnswers() {
    setState(() {
      possibleAnswers = answerController.text.split('\n');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: const Text('Magic Ball')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueGrey),
              child: const Text('Menu'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Reset ball'),
                Checkbox(
                  value: resetBall,
                  onChanged: (value) => _toggleReset(),
                ),
              ],
            ),
            TextField(
              maxLines: 30,
              controller: answerController,
              decoration: const InputDecoration(
                labelText: 'Enter your answers',
                hintText: 'Enter your answers',
              ),
              onChanged: (value) => _changeAnswers(),
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(450, 450)),
          child: Ball(possibleAnswers: possibleAnswers, shouldReset: resetBall),
        ),
      ),
    );
  }
}
