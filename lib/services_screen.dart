import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 1. Data Model (placeholder)
class Service {
  final String domain;
  final String plan;
  final String status;
  final String dueDate;

  Service({required this.domain, required this.plan, required this.status, required this.dueDate});
}

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {

  // 2. Mock Data
  final List<Service> _services = [
    Service(domain: 'meusite.com.br', plan: 'Hospedagem P', status: 'Ativo', dueDate: '25/12/2024'),
    Service(domain: 'meunegocio.com', plan: 'Hospedagem M', status: 'Ativo', dueDate: '15/11/2024'),
    Service(domain: 'meuprojeto.net', plan: 'Hospedagem G', status: 'Pendente', dueDate: '01/01/2025'),
    Service(domain: 'minhaloja.com.br', plan: 'Revenda', status: 'Inativo', dueDate: '10/10/2023'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Serviços'),
      ),
      body: ListView.builder(
        itemCount: _services.length,
        itemBuilder: (context, index) {
          final service = _services[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: Icon(_getStatusIcon(service.status), color: _getStatusColor(service.status)),
              title: Text(service.domain, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${service.plan} - Vence em ${service.dueDate}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.go('/services/${service.domain}');
              },
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
      case 'Pendente':
        return Icons.pending_actions;
      case 'Inativo':
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Ativo':
        return Colors.green.shade600;
      case 'Pendente':
        return Colors.orange.shade600;
      case 'Inativo':
        return Colors.red.shade600;
      default:
        return Colors.grey;
    }
  }
}
