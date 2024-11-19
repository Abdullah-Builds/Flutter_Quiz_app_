import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/options.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_competition.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
 final List<String>optionSelected = [];           //---------Stores the answers Selected by User
 var currentIndex = 0;

 void answerSelected ( String answer ){          //----------**Concept of Recursion is used here
   optionSelected.add(answer);
   _nextQuestion();
 }
 void _nextQuestion(){
   setState(() {
     if( currentIndex < questions.length-1){
       currentIndex++;
     }
     else {
       Get.offAll(() => QuizCompletionScreen( optionSelected,));
     }
   });
 }

  @override
  Widget build(context) {
    final object = questions[currentIndex];    // Important to Note and its placed in widget build since everytime set state is called it increments the count
    return Scaffold(
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const   BoxDecoration(
          gradient:  LinearGradient(
            colors: [
              Color(0xFF8A3EED),
              Color(0xFF1B0658),
            ],
            begin : Alignment.bottomLeft,
            end: Alignment.centerRight,
          ),
       ),
        child: Stack(
          children: [
             Column(
              mainAxisSize:  MainAxisSize.min,
              children: [
                const SizedBox(height: 100,),
                Text(object.text,style: GoogleFonts.poppins( fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textAlign : TextAlign.center),
                const SizedBox(height: 50,),

                ...object.getShuffleList().map((item){          //-----------------Inserting Values and Creates a Map dynamically Mapped
                  return Column(                                //-------Uses a shuffled list since directly uses it on questions.dart it also shuffles the list there also
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Answers(item, answerSelected, ),),),
                           const SizedBox(height: 30),
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.20,
                      child: Image.asset('assets/images/Animation#3 .gif'),
                    ),
                  ),
                )
              ],
            ),
          ],

        ),
      ),
    );
  }
}
