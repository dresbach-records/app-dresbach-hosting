import 'package:flutter/material.dart';

// 1. Data Model (placeholder)
class Domain {
  final String name;
  final String status;
  final String expirationDate;

  Domain({required this.name, required this.status, required this.expirationDate});
}

class DomainsScreen extends StatelessWidget {
  const DomainsScreen({super.key});

  // 2. Mock Data
  final List<Domain> _domains = const [
    Domain(name: 'meusite.com.br', status: 'Ativo', expirationDate: '25/12/2024'),
    Domain(name: 'meunegocio.com', status: 'Expirando', expirationDate: '15/02/2024'),
    Domain(name: 'meuprojeto.net', status: 'Ativo', expirationDate: '01/01/2025'),
    Domain(name: 'minhaloja.com.br', status: 'Expirado', expirationDate: '10/10/2023'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Domínios'),
      ),
      body: ListView.builder(
        itemCount: _domains.length,
        itemBuilder: (context, index) {
          final domain = _domains[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: Icon(_getStatusIcon(domain.status), color: _getStatusColor(domain.status)),
              title: Text(domain.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Expira em ${domain.expirationDate}'),
              trailing: _buildRenewButton(context, domain.status),
            ),
          );
        },
      ),
    );
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Ativo':
        return Icons.check_circle;
      case 'Expirando':
        return Icons.warning;
      case 'Expirado':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Ativo':
        return Colors.green.shade600;
      case 'Expirando':
        return Colors.orange.shade600;
      case 'Expirado':
        return Colors.red.shade600;
      default:
        return Colors.grey;
    }
  }

  Widget? _buildRenewButton(BuildContext context, String status) {
    if (status == 'Expirando' || status == 'Expirado') {
      return ElevatedButton(
        child: const Text('Renovar'),
        onPressed: () {
          // TODO: Implement renewal logic
        },
      );
    }
    return null;
  }
}
