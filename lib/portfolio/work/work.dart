import 'package:flutter/material.dart';
import '../models/work_item.dart';
import '../components/work_card.dart';

class WorkSection extends StatelessWidget {
  WorkSection({super.key});

  final List<WorkItem> works = [
    WorkItem(
      title: 'Designing Dashboards',
      year: '2020',
      category: 'Dashboard',
      description: 'Amet minim mollit non deserunt ullamco...',
      imageAsset: 'assets/images/img_rectangle_30.png',
    ),
    WorkItem(
      title: 'Vibrant Portraits of 2020',
      year: '2018',
      category: 'Illustration',
      description: 'Amet minim mollit non deserunt ullamco...',
      imageAsset: 'assets/images/img_rectangle_32.png',
    ),
    WorkItem(
      title: '36 Days of Malayalam type',
      year: '2018',
      category: 'Typography',
      description: 'Amet minim mollit non deserunt ullamco...',
      imageAsset: 'assets/images/img_rectangle_34.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Featured Works', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 20),
          ...works.map((work) => WorkCard(item: work)),
        ],
      ),
    );
  }
}
