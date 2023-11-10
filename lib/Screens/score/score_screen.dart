import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/constance.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qncontroller  = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset('assets/icons/bg.svg',
              fit: BoxFit.fill,height: 1000),
          Column(
            children: [
              Spacer(flex: 3,),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: KSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qncontroller.correctAns*10}/${_qncontroller.questions.length*10}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: KSecondaryColor),
              ),
              Spacer(flex: 3,),
            ],
          ),
        ],
      ),
    );
  }
}
