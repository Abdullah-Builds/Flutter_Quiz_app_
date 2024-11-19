import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'result_screen.dart';

class QuizCompletionScreen extends StatefulWidget {
  final List<String> optionSelected;

  const QuizCompletionScreen(this.optionSelected, {super.key});

  @override
  QuizCompletionScreenState createState() => QuizCompletionScreenState();
}

class QuizCompletionScreenState extends State<QuizCompletionScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => ResultScreen(widget.optionSelected));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8A3EED),
              Color(0xFF1B0658),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset('assets/images/Animation-.gif'),
            ),
            const SizedBox(height: 10),
            Text(
              'Analyzing the Results',
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
