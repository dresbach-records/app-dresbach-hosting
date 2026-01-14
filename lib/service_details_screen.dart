import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final String serviceId;

  const ServiceDetailsScreen({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(serviceId),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(context),
            const SizedBox(height: 24),
            Text('Ações Rápidas', style: textTheme.titleLarge),
            const SizedBox(height: 16),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(context, label: 'Plano', value: 'Hospedagem P'), // Mock data
            _buildInfoRow(context, label: 'Status', value: 'Ativo', valueColor: Colors.green.shade700),
            _buildInfoRow(context, label: 'Data de Registro', value: '25/12/2023'),
            _buildInfoRow(context, label: 'Próximo Vencimento', value: '25/12/2024'),
            _buildInfoRow(context, label: 'Valor do Ciclo', value: 'R$ 29,99'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, {required String label, required String value, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyLarge),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: valueColor,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.autorenew),
          label: const Text('Renovar Assinatura'),
          onPressed: () {
            // TODO: Implement renewal logic
          },
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          icon: const Icon(Icons.settings),
          label: const Text('Gerenciar Serviço'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: () {
            // TODO: Implement service management logic
          },
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          icon: const Icon(Icons.cancel_outlined),
          label: const Text('Solicitar Cancelamento'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: () {
            // TODO: Implement cancellation logic
          },
        ),
      ],
    );
  }
}
