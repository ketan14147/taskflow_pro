import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Soft light background
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning, Rahul 👋',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                      ),
                      Text(
                        'You have 5 tasks today',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Color(0xFFE3F2FD),
                    child: Icon(Icons.person, color: Color(0xFF007AFF)),
                  ),
                ],
              ),
            ),

            // Stats Grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _StatCard(title: 'Total', count: '12', color: Color(0xFF4A90E2)),
                  _StatCard(title: 'Done', count: '08', color: Colors.green),
                  _StatCard(title: 'Pending', count: '04', color: Colors.orange),
                  _StatCard(title: 'Overdue', count: '01', color: Colors.red),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // AI Insight Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFF3B82F6).withOpacity(0.1), const Color(0xFF2563EB).withOpacity(0.05)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF3B82F6).withOpacity(0.2)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.auto_awesome, color: Color(0xFF3B82F6)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'AI Insight: 2 tasks are at risk. Rahul is 15% behind schedule.',
                        style: TextStyle(color: Color(0xFF1E40AF), fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tasks Section
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Text(
                      "Today's Tasks",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    // In a real app this would be a ListView
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF007AFF),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Create Task', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;

  const _StatCard({required this.title, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 64) / 2,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(count, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
