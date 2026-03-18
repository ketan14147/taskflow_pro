import 'package:flutter/material.dart';
import '../widgets/task_widgets.dart';

// --- TASK LIST SCREEN ---
class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['All', 'Pending', 'Completed', 'Overdue'];

  final List<TaskItem> _allTasks = [
    TaskItem(title: 'Design TaskFlow UI', deadline: 'Today, 2:00 PM', status: 'Pending', assignedUser: 'JD', statusColor: Colors.blue),
    TaskItem(title: 'Integrate API', deadline: 'Tomorrow, 10:00 AM', status: 'Pending', assignedUser: 'AS', statusColor: Colors.orange),
    TaskItem(title: 'Meeting with Backend Team', deadline: 'Yesterday, 4:00 PM', status: 'Overdue', assignedUser: 'RK', statusColor: Colors.red),
    TaskItem(title: 'Initial Concept Draft', deadline: 'Mar 15, 12:00 PM', status: 'Completed', assignedUser: 'JD', statusColor: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: -1)),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Custom Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _tabs.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String label = entry.value;
                  bool isSelected = _selectedTabIndex == idx;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedTabIndex = idx),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF007AFF) : Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        label,
                        style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Scrollable List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemCount: _allTasks.length,
              itemBuilder: (context, index) {
                return TaskCard(task: _allTasks[index], onTap: () {});
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF007AFF),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// --- ANALYTICS SCREEN ---
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Analytics', style: TextStyle(fontWeight: FontWeight.bold)), elevation: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Overall Performance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              
              // Completion Chart Mockup
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF007AFF).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFF007AFF).withOpacity(0.1)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('78%', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF007AFF))),
                      Text('TASK COMPLETION RATE', style: TextStyle(fontSize: 12, color: Colors.grey[600], letterSpacing: 1)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),
              
              const Text('Team Leaderboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              
              // Leaderboard Items
              _LeaderboardItem(name: 'Alice Smith', performance: '92%', isBest: true),
              _LeaderboardItem(name: 'Rahul Kumar', performance: '65%', isBest: false, isWarning: true),
              const _LeaderboardItem(name: 'John Doe', performance: '82%', isBest: false),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final String name;
  final String performance;
  final bool isBest;
  final bool isWarning;

  const _LeaderboardItem({required this.name, required this.performance, this.isBest = false, this.isWarning = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.blue[100], child: const Icon(Icons.person, color: Colors.blue)),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  if (isBest) const Text('Best Performer', style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                  if (isWarning) const Text('Needs Improvement', style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Text(performance, style: TextStyle(fontWeight: FontWeight.bold, color: isWarning ? Colors.red : Colors.black)),
        ],
      ),
    );
  }
}
