import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckerfinder/provider/auth_provider.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final Map<String, String> _authData = {'email': '', 'password': ''};
  final _formKey = GlobalKey<FormState>();

  AuthMode _authMode = AuthMode.Login;
  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;

  bool _isLoading = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  Future<void> _onSubmitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    setState(() => _isLoading = true);

    _formKey.currentState?.save();

    Auth auth = Provider.of(context, listen: false);

    if (_isLogin()) {
      await auth.login(
        _authData['email']!,
        _authData['password']!,
      );
    } else {
      await auth.signup(
        _authData['email']!,
        _authData['password']!,
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return (Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: _isLogin() ? 310 : 380,
        width: deviceSize.width * 0.75,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: _isLogin()
                    ? null
                    : (value) {
                        final email = value ?? '';
                        if (email.trim().isEmpty || !email.contains('@')) {
                          return 'Insisra um E-mail válido';
                        }
                        return null;
                      },
              ),
              TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    suffixIcon: IconButton(
                      icon: Icon(
                        !_showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () =>
                          {setState(() => _showPassword = !_showPassword)},
                    ),
                  ),
                  obscureText: !_showPassword,
                  controller: _passwordController,
                  onSaved: (value) => _authData['password'] = value ?? '',
                  validator: _isLogin()
                      ? null
                      : (value) {
                          final password = value ?? '';
                          if (password.isEmpty || password.length < 5) {
                            return 'Senha precisa ter mais de 5 caracteres';
                          }
                          return null;
                        }),
              if (_isSignup())
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    suffixIcon: IconButton(
                      icon: Icon(
                        !_showConfirmPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () =>
                          {setState(() => _showConfirmPassword = !_showConfirmPassword)},
                    ),
                  ),
                  obscureText: !_showConfirmPassword,
                  validator: (value) {
                    final password = value ?? '';
                    if (password != _passwordController.text) {
                      return 'Senhas devem ser iguais';
                    }
                    return null;
                  },
                ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _onSubmitForm,
                      child: Text(
                          _authMode == AuthMode.Login ? 'Login' : 'Signup'),
                    ),
              const Spacer(),
              TextButton(
                onPressed: () => {
                  setState(
                    () {
                      if (_isLogin()) {
                        _authMode = AuthMode.Signup;
                      } else {
                        _authMode = AuthMode.Login;
                      }
                    },
                  )
                },
                child: Text(
                  _isLogin() ? 'DESEJA REGISTRAR?' : 'JÁ POSSUÍ CONTA?',
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
