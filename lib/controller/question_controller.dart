import 'dart:core';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Screens/score/score_screen.dart';

import '../models/Questions.dart';

// ignore: deprecated_member_use
class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? _animationController;
  Animation? _animation;
  Animation? get animation => _animation;

  PageController? _pageController;
  PageController? get pageController => _pageController;

  final List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'],
          ))
      .toList();

  List<Question> get questions => _questions;
  late bool _isAnswered = false;
  bool get isAnswered => _isAnswered;
  late int _correctAns;
  int get correctAns => _correctAns;
  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  late int _numberOfCorrectAns = 0;
  int get numberOfCorrectAns => _numberOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        update();
      });

    _animationController?.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController!.dispose();
    _pageController!.dispose();
  }

  void chekAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    if (_correctAns == selectedAns) _numberOfCorrectAns++;
    _animationController!.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
    nextQuestion();
    });
  }

  void nextQuestion(){
    if(_questionNumber.value!=_questions.length)
    {
      _isAnswered = false;
      _pageController
          ?.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController!.reset();
      _animationController!.forward().whenComplete(nextQuestion);
    }
    else{
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index){
    _questionNumber.value= index +1 ;
  }

}
