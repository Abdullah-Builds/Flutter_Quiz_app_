import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary(this.summary, {super.key});
  final List<Map<String,dynamic>> summary;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration:const  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(11.0),),
            color : Color(0xFFFBF2FF),
        ),
        height: MediaQuery.of(context).size.height * 0.50,
        width: MediaQuery.of(context).size.width * 0.70,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 16, bottom: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: summary.map(
                    (data) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${(data['question_index'] as int) + 1})', style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black,),),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 4, bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Question: ${data['question']}', style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black,),),
                                const SizedBox(height: 5),
                                Text('Correct Answer: ${data['correct_answer']}', style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.lightGreen,),),
                                const SizedBox(height: 3),
                                Text('User Entered: ${data['user_answer']}', style: GoogleFonts.lato(fontSize: 12, color: Colors.redAccent,),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
