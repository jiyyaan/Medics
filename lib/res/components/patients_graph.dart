import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PatientGraph extends StatelessWidget {
  const PatientGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
          child: SfCartesianChart(
            // Initialize category axis
              primaryXAxis: CategoryAxis(),
              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  // Bind data source
                    dataSource:  <SalesData>[
                      SalesData('Jan', 35),
                      SalesData('Feb', 28),
                      SalesData('Mar', 34),
                      SalesData('Apr', 32),
                      SalesData('May', 40)
                    ],
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales
                )
              ]
          )
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
