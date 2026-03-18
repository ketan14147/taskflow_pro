import 'package:flutter/material.dart';

// --- DATA MODEL ---
class TaskItem {
  final String title;
  final String deadline;
  final String status; // 'Pending', 'Completed', 'Overdue'
  final String assignedUser; // Avatar URL or initials
  final Color statusColor;

  TaskItem({
    required this.title,
    required this.deadline,
    required this.status,
    required this.assignedUser,
    required this.statusColor,
  });
}

// --- WIDGETS ---
class TaskCard extends StatelessWidget {
  final TaskItem task;
  final VoidCallback onTap;

  const TaskCard({super.key, required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            // Status indicator bar
            Container(
              width: 5,
              height: 40,
              decoration: BoxDecoration(
                color: task.statusColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(width: 16),
            
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(task.deadline, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            
            // Avatar
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.blue[50],
              child: Text(task.assignedUser, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
