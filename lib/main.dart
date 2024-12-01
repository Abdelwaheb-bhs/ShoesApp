import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/homePage.dart';
import 'providers/counterProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      
      create: (context) => Counter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter App',
        home: HomePage(),
      ),
    ),
  );
}
