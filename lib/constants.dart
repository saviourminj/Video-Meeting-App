import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle myStyle(double size , [Color color=Colors.black , FontWeight fontWt = FontWeight.w500]){
  return GoogleFonts.comfortaa(
    fontSize: size,
    color: color,
    fontWeight: fontWt
  );
}

CollectionReference userCollection = FirebaseFirestore.instance.collection('user');