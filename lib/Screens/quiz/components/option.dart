import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz_app/controller/question_controller.dart';

import '../../../constance.dart';


class Option extends StatelessWidget {
  const Option({
    super.key, required this.text, required this.index, required this.press,
  });
  final String text ;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        Color getTheRightColor(){
          if (qnController.isAnswered){
            if(index== qnController.correctAns){
              return KGreenColor;
            }else if(index == qnController.selectedAns && qnController .
            selectedAns!=qnController.correctAns){
              return KRedColor;}
          }
          return KGreyColor;
        }
        IconData getTheRightIcon(){
          return getTheRightColor() == KRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: const EdgeInsets.only(top: KDefaultPadding),
            padding: const EdgeInsets.all(KDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1} $text ",
                  style: const TextStyle(
                    color: KGreyColor,
                    fontSize: 16,
                  ),
                ),
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == KGreyColor
                        ?Colors.transparent
                        :getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor()),
                  ),
                  child: getTheRightIcon() == KGreyColor? null: Icon(
                    getTheRightIcon(),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
