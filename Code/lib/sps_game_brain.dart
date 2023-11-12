import 'constants.dart';
import 'stone_paper_scissor/game.dart';
import 'points.dart';

const int rock = 1;
const int paper = 2;
const int scissors = 3;

class GameBrain {
  int? _ai;
  final Choice choice;
  final int aiChoice;

  GameBrain({
    required this.choice,
    required this.aiChoice,
  });

  int getAiChoice() {
    return aiChoice;
  }

  Choice getHumanChoice() {
    return choice;
  }

  String getAiImageChoice() {
    _ai = getAiChoice();
    if (_ai == rock) {
      return kRock;
    } else if (_ai == paper) {
      return kPaper;
    } else {
      return kScissors;
    }
  }

  int fdpoints = 250;

  String checkWinner() {
    _ai = getAiChoice();
    getAiImageChoice();
    getHumanChoice();
    if (_ai == rock && getHumanChoice() == Choice.rock) {
      return 'Tied, Maybe Next Time !';
    } else if (_ai == rock && getHumanChoice() == Choice.paper) {
      Points.x += 2 * fdpoints;
      return 'You Won 500 Mirror Points !';
    } else if (_ai == rock && getHumanChoice() == Choice.scissors) {
      return 'You Lost, Maybe Next Time !';
    } else if (_ai == paper && getHumanChoice() == Choice.rock) {
      return 'You Lost, Maybe Next Time !';
    } else if (_ai == paper && getHumanChoice() == Choice.paper) {
      return 'Tied, Maybe Next Time !';
    } else if (_ai == paper && getHumanChoice() == Choice.scissors) {
      Points.x += 2 * fdpoints;
      return 'You Won 500 Mirror Points !';
    } else if (_ai == scissors && getHumanChoice() == Choice.rock) {
      Points.x += 2 * fdpoints;
      return 'You Won 500 Mirror Points !';
    } else if (_ai == scissors && getHumanChoice() == Choice.paper) {
      return 'You Lost, Maybe Next Time !';
    } else if (_ai == scissors && getHumanChoice() == Choice.scissors) {
      return 'Tied, Maybe Next Time !';
    } else {
      return '';
    }
  }
}
