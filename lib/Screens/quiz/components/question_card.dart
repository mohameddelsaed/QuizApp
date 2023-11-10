import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/question_controller.dart';

import '../../../constance.dart';
import '../../../models/Questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
   QuestionCard({
    super.key, required this.question,
  });
 final Question question;



  @override
  Widget build(BuildContext context) {
    QuestionController _controller =  Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: KDefaultPadding),
      padding: EdgeInsets.all(KDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(question.question,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: KBlackColor),
          ),
          SizedBox(height: KDefaultPadding/2,),
       ...List.generate(
           question.options.length,
               (index) => Option(
                 index: index,
                 text: question.options[index],
                 press: ()=> _controller .chekAns(
                     question, index),
               ),
       ),
        ],
      ),
    );
  }
}