

import 'package:flutter/material.dart';

class PGVCLApp extends StatelessWidget
{
  const PGVCLApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (

        theme: ThemeData
        (
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes:
        {
          '/': (context) => HomeScreen(),
          '/billPayment': (context) => BillPaymentScreen(),
          '/outageReport': (context) => OutageReportScreen(),
        },
      );
  }
}
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _Screen1State();
}

class _Screen1State extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("My Details"),),
        body: Center
          (
            child: Column
              (
                children:
                [
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.pushNamed(context, '/billPayment');
                    }, child: Text("Bill Payment")),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.pushNamed(context, '/outageReport');
                    }, child: Text("Outage Report"))

                ],
              ),
          ),
      );
  }
}
class BillPaymentScreen extends StatefulWidget
{
  const BillPaymentScreen({super.key});

  @override
  State<BillPaymentScreen> createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen>
{
  TextEditingController bill = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Bill Payment"),),
        body: Center
          (
            child: Column
              (
                children:
                [
                    TextFormField
                      (
                        controller:bill,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration
                          (
                          labelText: 'Enter Bill Amount',
                          border: OutlineInputBorder(),
                          ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(onPressed: ()
                      {
                          String billAmount = bill.text.toString();
                           //int a = int.parse(billAmount);


                          if (billAmount.isNotEmpty ) {
                          // Simulating a payment process
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Payment Successful'),
                                content: Text('You have paid ₹$billAmount.'),
                                actions: [
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
                        }
                        else
                        {
                                showDialog(context: context, builder: (context)
                                {
                                  return AlertDialog
                                    (
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
                                });
                        }


                      },child: Text("Pay Bill"),)

                ],
              ),
          ),
      );
  }
}
class OutageReportScreen extends StatefulWidget
{
  const OutageReportScreen({super.key});

  @override
  State<OutageReportScreen> createState() => _OutageReportScreenState();
}

class _OutageReportScreenState extends State<OutageReportScreen> {

  TextEditingController outage = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Outage Report"),),
        body: Center
          (
          child: Column
            (
            children:
            [
              TextFormField
                (
                controller:outage,
                keyboardType: TextInputType.text,
                decoration: InputDecoration
                  (
                  labelText: 'Enter Location',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()
              {
                String outagevalue = outage.text.toString();
                //int a = int.parse(billAmount);


                if (outagevalue.isNotEmpty ) {
                  // Simulating a payment process
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Done'),
                        content: Text('Your lOcation is $outagevalue'),
                        actions: [
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
                }
                else
                {
                  showDialog(context: context, builder: (context)
                  {
                    return AlertDialog
                      (
                      title: Text('Error'),
                      content: Text('Please enter a valid location.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Text('OK'),
                        ),
                      ],

                    );
                  });
                }


              },child: Text("Click HEre"),)

            ],
          ),
          ),
      );
  }
}



