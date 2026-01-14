import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/welcome_screen.dart';
import 'package:myapp/dashboard_screen.dart';
import 'package:myapp/services_screen.dart';
import 'package:myapp/service_details_screen.dart';
import 'package:myapp/invoices_screen.dart';
import 'package:myapp/tickets_screen.dart';
import 'package:myapp/domains_screen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  final _cpfCnpjMask = MaskTextInputFormatter(
    mask: '###.###.###-##', // Initial mask for CPF
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  void _updateMask(String value) {
    final cleanedValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanedValue.length > 11) {
      _cpfCnpjMask.updateMask(mask: '##.###.###/####-##'); // CNPJ mask
    } else {
      _cpfCnpjMask.updateMask(mask: '###.###.###-##'); // CPF mask
    }
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement login logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login efetuado com sucesso! (simulado)')),
      );
      // On successful login, navigate to the dashboard
      context.go('/dashboard'); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Área do Cliente'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Acesse sua conta',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  onChanged: _updateMask,
                  inputFormatters: [_cpfCnpjMask],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'CPF ou CNPJ',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_pin_rounded),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe seu CPF ou CNPJ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe sua senha';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password functionality
                    },
                    child: const Text('Esqueci minha senha'),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('ENTRAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Placeholder screens

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Contratar Planos')));
}

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Suporte')));
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'order',
          builder: (BuildContext context, GoRouterState state) {
            return const OrderScreen();
          },
        ),
        GoRoute(
          path: 'support',
          builder: (BuildContext context, GoRouterState state) {
            return const SupportScreen();
          },
        ),
        GoRoute(
          path: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const DashboardScreen();
          },
        ),
        GoRoute(
            path: 'services',
            builder: (BuildContext context, GoRouterState state) {
              return const ServicesScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                path: ':serviceId',
                builder: (BuildContext context, GoRouterState state) {
                  final serviceId = state.pathParameters['serviceId']!;
                  return ServiceDetailsScreen(serviceId: serviceId);
                },
              )
            ]),
        GoRoute(
          path: 'invoices',
          builder: (BuildContext context, GoRouterState state) {
            return const InvoicesScreen();
          },
        ),
        GoRoute(
          path: 'tickets',
          builder: (BuildContext context, GoRouterState state) {
            return const TicketsScreen();
          },
        ),
        GoRoute(
          path: 'domains',
          builder: (BuildContext context, GoRouterState state) {
            return const DomainsScreen();
          },
        ),
      ],
    ),
  ],
);
