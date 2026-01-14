import 'package:flutter/material.dart';

// 1. Data Model (placeholder)
class Invoice {
  final String id;
  final String description;
  final String status;
  final String dueDate;
  final String amount;

  Invoice({required this.id, required this.description, required this.status, required this.dueDate, required this.amount});
}

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  // 2. Mock Data
  final List<Invoice> _invoices = const [
    Invoice(id: 'INV-001', description: 'Hospedagem P - Anual', status: 'Paga', dueDate: '25/12/2023', amount: 'R$ 359,88'),
    Invoice(id: 'INV-002', description: 'Registro de Domínio', status: 'Paga', dueDate: '15/11/2023', amount: 'R$ 49,99'),
    Invoice(id: 'INV-003', description: 'Hospedagem M - Mensal', status: 'Pendente', dueDate: '25/01/2024', amount: 'R$ 49,99'),
    Invoice(id: 'INV-004', description: 'SSL Certificado', status: 'Vencida', dueDate: '10/01/2024', amount: 'R$ 99,99'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Faturas'),
      ),
      body: ListView.builder(
        itemCount: _invoices.length,
        itemBuilder: (context, index) {
          final invoice = _invoices[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: Icon(_getStatusIcon(invoice.status), color: _getStatusColor(invoice.status)),
              title: Text(invoice.description, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Vence em ${invoice.dueDate} - ${invoice.amount}'),
              trailing: _buildPayButton(context, invoice.status),
            ),
          );
        },
      ),
    );
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Paga':
        return Icons.check_circle;
      case 'Pendente':
        return Icons.pending_actions;
      case 'Vencida':
        return Icons.error;
      default:
        return Icons.help_outline;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Paga':
        return Colors.green.shade600;
      case 'Pendente':
        return Colors.orange.shade600;
      case 'Vencida':
        return Colors.red.shade600;
      default:
        return Colors.grey;
    }
  }

  Widget? _buildPayButton(BuildContext context, String status) {
    if (status == 'Pendente' || status == 'Vencida') {
      return ElevatedButton(
        child: const Text('Pagar'),
        onPressed: () {
          // TODO: Implement payment logic
        },
      );
    }
    return null;
  }
}
