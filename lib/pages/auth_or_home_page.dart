import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import 'auth_page.dart';
import 'main_page.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Auth auth = Provider.of(context);

    return auth.isAuth ? const MainPage() : const AuthPage();
  }
}
