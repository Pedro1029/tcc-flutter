import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckerfinder/pages/cadastro_frete_page.dart';
import 'package:truckerfinder/pages/cadastro_pessoa_page.dart';
import 'package:truckerfinder/pages/encontrar_motoristas_page.dart';
import 'package:truckerfinder/pages/home_page.dart';
import 'package:truckerfinder/provider/google_maps_provider.dart';
import 'package:truckerfinder/provider/pessoas_provider.dart';
import 'package:truckerfinder/utils/app_routes.dart';

import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PessoaProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GoogleMapsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Trucker Finder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.MAIN: (ctx) => const MainPage(),
          AppRoutes.CADASTRO_PESSOA: (ctx) => const CadastroPessoaPage(),
          AppRoutes.HOME_PAGE: (ctx) => const HomePage(),
          AppRoutes.CADASTRO_FRETE: (ctx) => const CadastroFretePage(),
          AppRoutes.ENCONTRAR_MOTORISTAS: (ctx) =>
              const EncontrarMotoristasPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
