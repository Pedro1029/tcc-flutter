import 'package:flutter/material.dart';
import 'package:truckerfinder/pages/cadastro_pessoa_page.dart';
import 'package:truckerfinder/utils/app_routes.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trucker Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        AppRoutes.CADASTRO_PESSOA:(context) => const CadastroPessoaPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
