import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckerfinder/models/pessoa_models.dart';

import '../components/pessoas_list.dart';
import '../provider/pessoas_provider.dart';
import '../utils/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  Future<void> _refreshPessoas(BuildContext context) {
    return Provider.of<PessoaProvider>(context, listen: false)
        .fetchAllPessoas()
        .then((value) => {setState(() => _isLoading = false)});
  }

  @override
  void initState() {
    Provider.of<PessoaProvider>(context, listen: false)
        .fetchAllPessoas()
        .then((value) => {setState(() => _isLoading = false)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Pessoa> pessoas = Provider.of<PessoaProvider>(context).all;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => _refreshPessoas(context),
              child: PessoasList(pessoas)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.CADASTRO_PESSOA);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
