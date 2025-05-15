import 'package:flutter/material.dart';
import '../models/work_item.dart';

class WorkCard extends StatelessWidget {
  final WorkItem item;

  const WorkCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(item.imageAsset, fit: BoxFit.cover),
        const SizedBox(height: 10),
        Text(item.title, style: Theme.of(context).textTheme.headlineSmall),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(item.year, style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 10),
            Text(item.category, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 10),
        Text(item.description),
        const Divider(height: 40),
      ],
    );
  }
}
