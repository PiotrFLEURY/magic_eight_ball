import 'package:ecole_it_demo/view/widgets/magic_ball.dart';
import 'package:ecole_it_demo/view/widgets/magic_card.dart';
import 'package:ecole_it_demo/view_model/magic_ball_view_model.dart';
import 'package:flutter/material.dart';

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({super.key});

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  late TextEditingController answerController;
  late MagicBallViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = MagicBallViewModel()..initPossibleAnswers();
    answerController = TextEditingController(
      text: viewModel.possibleAnswers.join('\n'),
    );
  }

  void _changeAnswers() {
    viewModel.changeAnswers(answerController.text);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder:
          (context, _) => Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(title: const Text('Magic Ball')),
            drawer: Drawer(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Reset ball'),
                      Checkbox(
                        value: viewModel.resetBall,
                        onChanged: (value) => viewModel.toggleReset(value),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Appearance'),
                      Switch(
                        value:
                            viewModel.appearance == Appearance.ball
                                ? false
                                : true,
                        onChanged: (value) => viewModel.toggleAppearance(),
                      ),
                    ],
                  ),
                  Divider(),
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
                constraints: BoxConstraints.tight(Size(300, 450)),
                child:
                    viewModel.appearance == Appearance.ball
                        ? MagicBall(
                          possibleAnswers: viewModel.possibleAnswers,
                          shouldReset: viewModel.resetBall,
                        )
                        : MagicCard(
                          possibleAnswers: viewModel.possibleAnswers,
                          shouldReset: viewModel.resetBall,
                        ),
              ),
            ),
          ),
    );
  }
}
