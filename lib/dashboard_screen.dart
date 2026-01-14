import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Conta'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () {
              // TODO: Implement logout logic
              context.go('/'); // Navigate back to welcome screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem-vindo, Cliente!', // TODO: Replace with dynamic user name
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Aqui está um resumo da sua conta.',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildDashboardCard(
                  context,
                  icon: Icons.cloud_queue,
                  label: 'Serviços',
                  value: '3', // TODO: Replace with dynamic data
                  onTap: () => context.go('/services'),
                ),
                _buildDashboardCard(
                  context,
                  icon: Icons.language,
                  label: 'Domínios',
                  value: '5', // TODO: Replace with dynamic data
                  onTap: () => context.go('/domains'),
                ),
                _buildDashboardCard(
                  context,
                  icon: Icons.support_agent,
                  label: 'Tickets',
                  value: '2', // TODO: Replace with dynamic data
                  onTap: () => context.go('/tickets'),
                ),
                _buildDashboardCard(
                  context,
                  icon: Icons.receipt_long,
                  label: 'Faturas',
                  value: '1', // TODO: Replace with dynamic data
                  onTap: () => context.go('/invoices'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, {required IconData icon, required String label, required String value, VoidCallback? onTap}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: colorScheme.primary),
              const SizedBox(height: 12),
              Text(
                value,
                style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
