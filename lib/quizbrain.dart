import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question("Naruto loves Hinata", true),
    Question("sukura hates Naruto", false),
    Question("Hinata is the Cutest", true),
    Question("Hitesh always come college late", true),
    Question("shakti GYM Mein snap he leta he bas", false),
    Question("yash choko moko he,par dil ka mast he banda he!", true),
    Question("google is worst in AI", false),
    Question("priyam Android Developer bana chahata he!", false),
    Question("cats are the cutest!", true),
    Question("Bilal is alaways be the best  buddy", true),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
