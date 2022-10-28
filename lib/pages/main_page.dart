import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckerfinder/models/pessoa_models.dart';
import 'package:truckerfinder/provider/auth_provider.dart';

import '../components/pessoas_list.dart';
import '../provider/pessoas_provider.dart';
import '../utils/app_routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        .then((value) => {
              setState(() => {_isLoading = false}),
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Pessoa> pessoas = Provider.of<PessoaProvider>(context).all;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
        actions: [
          IconButton(
            onPressed: () => {
              Provider.of<Auth>(context, listen: false).logout(),
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.AUTH_OR_HOME_PAGE,
              )
            },
            icon: const Icon(Icons.logout),
          )
        ],
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
