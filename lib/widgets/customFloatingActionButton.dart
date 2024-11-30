import 'package:flutter/material.dart';
import '../ui_helper/helperFunctions.dart';

Widget myCustomFloatingActionButton = FloatingActionButton(
  onPressed: () {},
  backgroundColor:  HelperFunctions().myGreen,
  child: const Icon(
    Icons.home_filled,
    color: Colors.white,
    size: 35,
  ),
);