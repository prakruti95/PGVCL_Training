import 'dart:io';

import 'package:crpt_material_day3/withcupertino.dart';
import 'package:flutter/material.dart';

// void main()
// {
//   runApp(PGVCLApp());
// }
void main() {
  // Run the appropriate app based on the platform
  if (Platform.isIOS) {
    runApp(PGVCLAppCupertino());
  } else {
    runApp(PGVCLAppMaterial());
  }
}

class PGVCLApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PGVCL App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/billPayment': (context) => BillPaymentScreen(),
        '/outageReport': (context) => OutageReportScreen(),
      },
    );
  }
}

// --- Home Screen ---
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PGVCL Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Bill Payment'),
              onPressed: () {
                Navigator.pushNamed(context, '/billPayment');
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Report Outage'),
              onPressed: () {
                Navigator.pushNamed(context, '/outageReport');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// --- Bill Payment Screen ---
class BillPaymentScreen extends StatelessWidget {
  final TextEditingController _billAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bill Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _billAmountController,
              decoration: InputDecoration(
                labelText: 'Enter Bill Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final billAmount = _billAmountController.text;
                if (billAmount.isNotEmpty) {
                  // Simulating a payment process
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Payment Successful'),
                        content: Text('You have paid ₹$billAmount.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context); // Navigate back to Home
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Show error if no amount is entered
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a valid bill amount.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Pay Bill'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Outage Report Screen ---
class OutageReportScreen extends StatelessWidget {
  final TextEditingController _outageLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report Outage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _outageLocationController,
              decoration: InputDecoration(
                labelText: 'Enter Outage Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final outageLocation = _outageLocationController.text;
                if (outageLocation.isNotEmpty) {
                  // Simulating outage report submission
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Outage Reported'),
                        content: Text('Outage reported at $outageLocation.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context); // Navigate back to Home
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Show error if no location is entered
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter the outage location.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Report Outage'),
            ),
          ],
        ),
      ),
    );
  }
}
