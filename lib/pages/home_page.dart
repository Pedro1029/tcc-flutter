import 'package:flutter/material.dart';
import 'package:truckerfinder/components/app_drawer.dart';
import 'package:truckerfinder/models/pessoa_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    Pessoa pessoaSelected = ModalRoute.of(context)?.settings.arguments as Pessoa;
    return Scaffold(
      drawer: AppDrawer(
          pessoaSelected: pessoaSelected),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}
