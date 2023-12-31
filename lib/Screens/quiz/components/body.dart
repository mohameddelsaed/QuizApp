import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Screens/quiz/components/question_card.dart';
import 'package:quiz_app/constance.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'brogress_bar.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset('assets/icons/bg.svg',
            fit: BoxFit.fill,height: 1000),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: KDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(height: KDefaultPadding,),
              Padding(
                padding : const EdgeInsets.symmetric(horizontal: KDefaultPadding),
                child: Obx(()=>Text.rich(
                  TextSpan(
                    text: 'Question ${_questionController.questionNumber.value}',
                    style: Theme.of(context).textTheme.headlineMedium!.
                    copyWith(color: KSecondaryColor),
                    children: [
                      TextSpan(
                        text: '/${_questionController.questions.length}',
                        style: Theme.of(context).textTheme.headlineSmall!.
                        copyWith(color: KSecondaryColor),
                      ),
                    ],
                  ),
                ),),
              ),
              const Divider(thickness: 1.5,),
              const SizedBox(height: KDefaultPadding,),
              Expanded(
                  child:  PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: _questionController.updateTheQnNum,
                    controller: _questionController.pageController,
                    itemCount: _questionController.questions.length,
                      itemBuilder: (context,index) => QuestionCard(
                        question: _questionController.questions[index],
                      ),
                  ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}


