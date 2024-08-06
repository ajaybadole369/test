import 'package:flutter/material.dart';

// COLOR CONSTANTS
const Color primary = Color(0xFF007AFF);
const Color secondary = Color(0xFFD8F1FE);
const Color primaryLabelColor = Color(0xFF212226);
const Color secondaryLabelColor = Color(0xFF949BA5);
const Color kWhite = Colors.white;
const Color kBlack = Colors.black;
const Color kTransparent = Colors.transparent;

// Gradient color

LinearGradient scaffoldBackgroundLiner = const LinearGradient(
    colors: [secondary, kWhite, secondary],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    stops: [.1, .5, 1]);

BoxDecoration boxDecoration = BoxDecoration(gradient: scaffoldBackgroundLiner);
