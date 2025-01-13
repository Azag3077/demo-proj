import 'package:flicks_by/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider.dart';

class DemoScreen extends ConsumerStatefulWidget {
  const DemoScreen({super.key});

  @override
  ConsumerState<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends ConsumerState<DemoScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) =>
      ref.read(pageIndexProvider.notifier).state = index;

  void _onPreviousBtn() {
    _pageController.previousPage(duration: 300.ms, curve: Curves.linear);
    ref.read(pageIndexProvider.notifier).update((index) => index - 1);
  }

  void _onNextBtn() {
    final index = ref.read(pageIndexProvider);
    final length = ref.read(questionsProvider).length;

    if (index == length - 1) return _submit();

    _pageController.nextPage(duration: 300.ms, curve: Curves.linear);
    ref.read(pageIndexProvider.notifier).update((index) => index + 1);
  }

  void _submit() {
    showAdaptiveDialog(
      context: context,
      builder: (_) {
        final questions = ref.read(questionsProvider);
        final count =
            questions.where((question) => !question.isAnswered).length;

        return AlertDialog(
          title: const Text('Submit Quiz'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (count > 0) ...[
                Text(
                  'You have $count question${count > 1 ? 's' : ''} '
                  'that are yet to be answered.',
                ),
                const SizedBox(height: 8.0),
              ],
              Text('Are you sure you want to submit the quiz?'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _handleSubmit();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _handleSubmit() {}

  void _onAnswer(String answer) {
    final index = ref.read(pageIndexProvider);

    ref.read(questionsProvider.notifier).update((questions) {
      final question = questions.elementAt(index).answerQuestion(answer);
      questions[index] = question;
      return [...questions];
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = ref.watch(pageIndexProvider);
    final questions = ref.watch(questionsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Simple Quiz App')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Question ${pageIndex + 1} of ${questions.length}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: PageView.builder(
                  itemCount: questions.length,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (_, int index) => QuestionLayout(
                    questionModel: questions.elementAt(index),
                    onAnswer: _onAnswer,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FilledButton(
                  onPressed: pageIndex == 0 ? null : _onPreviousBtn,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back),
                      const SizedBox(width: 8.0),
                      Text('Previous'),
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: _onNextBtn,
                  child: Row(
                    children: <Widget>[
                      Text(
                        pageIndex < questions.length - 1 ? 'Next' : 'Submit',
                      ),
                      const SizedBox(width: 8.0),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionLayout extends StatelessWidget {
  const QuestionLayout({
    super.key,
    required this.questionModel,
    required this.onAnswer,
  });
  final QuestionModel questionModel;
  final ValueChanged<String> onAnswer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(questionModel.question),
          const SizedBox(height: 8.0),
          ...questionModel.options
              .asMap()
              .entries
              .map((entry) => OptionButton(
                    index: entry.key,
                    text: entry.value,
                    isSelected: entry.value == questionModel.userAnswer,
                    onSelected: () => onAnswer(entry.value),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.index,
    required this.text,
    required this.isSelected,
    required this.onSelected,
  });
  final int index;
  final String text;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onSelected,
      elevation: 0,
      height: 48.0,
      color: isSelected ? Colors.grey.shade300 : null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Row(
        children: <Widget>[
          Text('${index + 1}.'),
          const SizedBox(width: 8.0),
          Text(text),
        ],
      ),
    );
  }
}
