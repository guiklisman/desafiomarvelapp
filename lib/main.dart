import 'package:desafio_marvel/screens/Inicial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/conectar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Conectar(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Desafio Marvel',
        theme: ThemeData(),
        home: Inicial(),
      ),
    );
  }
}
