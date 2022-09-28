import 'package:flutter/material.dart';
import 'package:truckerfinder/components/app_drawer.dart';
import 'package:truckerfinder/models/pessoa_models.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) {
    Pessoa pessoaSelected = ModalRoute.of(context)?.settings.arguments as Pessoa;
    return Scaffold(
      drawer: AppDrawer(
          pessoaSelected: pessoaSelected),
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
    );
  }
}
