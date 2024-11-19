import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/result_summary.dart';
import 'package:quiz_app/data/questions.dart';
import 'start_screen.dart';


class ResultScreen extends StatelessWidget {
   const ResultScreen(this.answersSelected,{super.key});

  final List<String>answersSelected;
 List<Map<String,dynamic>>getSummary(){                //use of Maps
   List<Map<String,dynamic>>summary =[];
   for(int i=0; i<answersSelected.length;i++){
     summary.add(
         {
           'question_index' : i,
           'question' : questions[i].text,
           'correct_answer' : questions[i].answers[0],
           'user_answer' : answersSelected[i],
         }
     );
   }
   return summary;
 }

  @override
  Widget build(BuildContext context) {                  // local variables
    final summary = getSummary();                       //cannot be directly called since it  returns 
    final totalQuestions = questions.length;
    final correctedAnswers = summary.where((data) =>  data['correct_answer'] == data['user_answer'],
    ).length;


    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const   BoxDecoration(
          gradient:  LinearGradient(
            colors: [
              Color(0xFF8A3EED),
              Color(0xFF1B0658)
            ],
            begin : Alignment.bottomLeft,
            end: Alignment.centerRight,
          ),
       ),
        child: Column(
          children: [
            const SizedBox(height : 80),
            Text('You answered $correctedAnswers questions out of $totalQuestions.',style:GoogleFonts.lato(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16)),
            const SizedBox(height : 20),
            Text('List of Answers and Questions ',style:GoogleFonts.lato(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
            const SizedBox(height : 50),
            ResultSummary(summary),
            const SizedBox(height : 30),
            Center(child: TextButton(onPressed: ()=> Get.to(() => const StartScreen()), child: Text('Restart Quiz',style:GoogleFonts.lato(fontSize : 14,color:Colors.white,fontWeight: FontWeight.bold,),),)),
          ],
        ),
      ),
    );
  }
}
