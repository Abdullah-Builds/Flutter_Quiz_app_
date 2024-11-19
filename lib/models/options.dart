import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answers extends StatelessWidget {
   const Answers(this.ansText,this.onTap,{super.key});

  final String ansText;
  final void Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
           onPressed: ()=>onTap(ansText),
              style : ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(11.0),),padding :const  EdgeInsets.all(11),),
              child:  Text(ansText,style: GoogleFonts.lato( fontSize:16,color: Colors.black),textAlign: TextAlign.center) ,
    );
  }
}
