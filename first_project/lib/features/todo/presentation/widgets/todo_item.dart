import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onCheck;

  const TodoItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onEdit,
    this.onDelete,
    this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get current theme

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor, // Use theme for background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Expanded column for title & subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Action buttons
          Row(
            children: [
              IconButton(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit, color: theme.primaryColor)),
              IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: theme.primaryColor)),
              IconButton(
                  onPressed: onCheck,
                  icon: Icon(Icons.check, color: theme.primaryColor)),
            ],
          ),
        ],
      ),
    );
  }
}
