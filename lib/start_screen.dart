import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/quiz_questions_UI.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
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
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 150,),
                Image.asset('assets/images/quiz-logo.png',width: 200,color: Colors.black45,),
                const SizedBox( height: 30,),
                const Text('Lets Start the Flutter Quiz Now',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                const SizedBox(height: 20,),
                OutlinedButton.icon(
                    onPressed: ()=> Get.to(()=>const Questions()),
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                    icon : const Icon(Icons.ad_units_outlined),
                    label: const Text(' Start Now ',style: TextStyle(fontSize: 16,color: Colors.white),),),
              ],
            ),
      ),
    );
  }
}
