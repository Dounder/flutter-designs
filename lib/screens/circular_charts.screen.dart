import 'package:flutter/material.dart';
import 'package:design_app/widgets/widgets.dart';

class CircularChartsScreen extends StatefulWidget {
  const CircularChartsScreen({Key? key}) : super(key: key);

  @override
  State<CircularChartsScreen> createState() => _CircularChartsScreenState();
}

class _CircularChartsScreenState extends State<CircularChartsScreen> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.red,
              ),
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.blue,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.indigo,
              ),
              CustomRadialProgress(
                percentage: percentage,
                color: Colors.green,
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          percentage += 10;

          if (percentage > 100) {
            percentage = 0;
          }

          setState(() {});
        },
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double percentage;
  final Color color;

  const CustomRadialProgress({
    Key? key,
    required this.percentage,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 180,
      width: 180,
      child: RadialProgress(
        percentage: percentage,
        primaryColor: color,
      ),
    );
  }
}
