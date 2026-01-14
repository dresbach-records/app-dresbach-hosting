import 'package:flutter/material.dart';

// 1. Data Model (placeholder)
class Ticket {
  final String id;
  final String subject;
  final String status;
  final String lastUpdate;

  Ticket({required this.id, required this.subject, required this.status, required this.lastUpdate});
}

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  // 2. Mock Data
  final List<Ticket> _tickets = const [
    Ticket(id: 'TKT-001', subject: 'Dúvida sobre cobrança', status: 'Aberto', lastUpdate: '20/01/2024'),
    Ticket(id: 'TKT-002', subject: 'Site fora do ar', status: 'Em Andamento', lastUpdate: '22/01/2024'),
    Ticket(id: 'TKT-003', subject: 'Problema com e-mail', status: 'Resolvido', lastUpdate: '15/01/2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets de Suporte'),
      ),
      body: ListView.builder(
        itemCount: _tickets.length,
        itemBuilder: (context, index) {
          final ticket = _tickets[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: Icon(_getStatusIcon(ticket.status), color: _getStatusColor(ticket.status)),
              title: Text(ticket.subject, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Atualizado em ${ticket.lastUpdate}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Navigate to ticket details screen
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to create new ticket screen
        },
        label: const Text('Novo Ticket'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Aberto':
        return Icons.open_in_new;
      case 'Em Andamento':
        return Icons.sync;
      case 'Resolvido':
        return Icons.check_circle;
      default:
        return Icons.help_outline;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Aberto':
        return Colors.blue.shade600;
      case 'Em Andamento':
        return Colors.orange.shade600;
      case 'Resolvido':
        return Colors.green.shade600;
      default:
        return Colors.grey;
    }
  }
}
