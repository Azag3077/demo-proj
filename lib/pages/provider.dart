import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/question.dart';

final pageIndexProvider = StateProvider<int>((_) => 0);

final questionsProvider = StateProvider<List<QuestionModel>>((_) {
  final questions = <Map<String, dynamic>>[
    {
      'numb': '1',
      'question': 'Which singer is known as the “Queen of Pop”?',
      'answer': 'Hogwarts',
      'options': ['Beauxbatons', 'Ilvermorny', 'Hogwarts', 'Durmstrang']
    },
    {
      'numb': '2',
      'question': 'Which singer is known as the “Queen of Pop"?',
      'answer': 'Madonna',
      'options': ['Britney Spears', 'Madonna', 'Lady Gaga', 'Beyoncé']
    },
    {
      'numb': '3',
      'question': 'What is the smallest planet in our solar system',
      'answer': 'Mecury',
      'options': ['Venus', 'Mars', 'Pluto', 'Mecury'],
    },
    {
      'numb': '4',
      'question': 'Which country is known as the land of Rising Sun',
      'answer': 'Japan',
      'options': ['China', 'Japan', 'Thailand', 'South Korea'],
    },
    {
      'numb': '5',
      'question':
          'Which movie features the quote, "May the Force be with you"?',
      'answer': 'Star Wars',
      'options': [
        'Star Wars',
        'Star Trek',
        'The avengers',
        "Guardians of the Galaxy"
      ],
    },
    {
      'numb': '6',
      'question': 'What is the name of the longest river in the world?',
      'answer': 'Nile',
      'options': ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
    },
    {
      'numb': '7',
      'question': 'Who developed the theory of relativity?',
      'answer': 'Albert Einstein',
      'options': [
        'Galileo Galilei',
        'Issac Newton',
        'Nikola Tesla',
        'Albert Einstein'
      ],
    },
    {
      'numb': '8',
      'question':
          'Who voiced the character of Simba in Disney’s The Lion King (1994)?',
      'answer': 'Matthew Broderick',
      'options': [
        'Jeremy Irons',
        'James Earl Jones',
        'Matthew Broderick',
        'Jonathan Taylor Thomas'
      ],
    },
    {
      'numb': '9',
      'question': 'What gets wetter the more it dries?',
      'answer': 'Towel',
      'options': ['Towel', 'Sponge', 'Ice', 'Soap'],
    },
    {
      'numb': '10',
      'question': 'What does HTTP stand for',
      'answer': 'HyperText Transfer Protocol',
      'options': [
        'HyperText Transmission Protocol',
        'High-Tech Transfer Protocol',
        'HyperText Transfer Protocol',
        'HyperText Tracking Protocol'
      ],
    },
  ];
  return questions.map((que) => QuestionModel.fromJson(que)).toList();
});
