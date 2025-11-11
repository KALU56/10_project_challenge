import 'package:flutter/material.dart';

class StatWidget extends StatelessWidget {
  final String title;
  final int done;
  final int total;

  const StatWidget({
    super.key,
    required this.title,
    required this.done,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    double percent = (done / total) * 100;

    return Container(
      padding: const EdgeInsets.all(12), // space inside the container
      margin: const EdgeInsets.all(8),   // space outside the container
      decoration: BoxDecoration(
        color: Colors.white,             // card background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title and done/total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text("$done / $total"),
            ],
          ),
          SizedBox(height: 8),
          // Percent
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text("${percent.toStringAsFixed(1)}%"),
               
            ]
          )
         
        ],
      ),
    );
  }
}
