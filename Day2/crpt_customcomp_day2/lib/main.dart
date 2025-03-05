import 'package:flutter/material.dart';

void main() {
  runApp(CustomComponentsApp());
}

class CustomComponentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Flutter Components',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom UI Components'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('Custom Buttons'),
            CustomButtonsSection(),
            Divider(),
            SectionTitle('Custom Text Fields'),
            CustomTextFieldsSection(),
            Divider(),
            SectionTitle('Custom Cards'),
            CustomCardsSection(),
            Divider(),
            SectionTitle('Custom Switch and Slider'),
            CustomSwitchAndSlider(),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }
}

class CustomButtonsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Elevated'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text('Outlined'),
          style: OutlinedButton.styleFrom(
            primary: Colors.blue,
            side: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Text'),
          style: TextButton.styleFrom(primary: Colors.blue),
        ),
      ],
    );
  }
}

class CustomTextFieldsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(color: Colors.blue),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            prefixIcon: Icon(Icons.person, color: Colors.blue),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            filled: true,
            fillColor: Colors.blue.shade50,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
            prefixIcon: Icon(Icons.search, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}

class CustomCardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Card Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('This is a customizable card with an attractive UI.'),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        Card(
          elevation: 5,
          color: Colors.blue.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text('Card with Icon'),
            subtitle: Text('This card contains an icon for a modern look.'),
          ),
        ),
      ],
    );
  }
}

class CustomSwitchAndSlider extends StatefulWidget {
  @override
  _CustomSwitchAndSliderState createState() => _CustomSwitchAndSliderState();
}

class _CustomSwitchAndSliderState extends State<CustomSwitchAndSlider> {
  bool _isSwitched = false;
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Enable Feature:', style: TextStyle(fontSize: 16)),
            Switch(
              value: _isSwitched,
              onChanged: (value) {
                setState(() {
                  _isSwitched = value;
                });
              },
              activeColor: Colors.blue,
              inactiveThumbColor: Colors.grey,
            ),
          ],
        ),
        SizedBox(height: 16),
        Text('Adjust Value: ${_sliderValue.toInt()}%', style: TextStyle(fontSize: 16)),
        Slider(
          value: _sliderValue,
          min: 0,
          max: 100,
          divisions: 10,
          onChanged: (value) {
            setState(() {
              _sliderValue = value;
            });
          },
          activeColor: Colors.blue,
          inactiveColor: Colors.grey.shade300,
        ),
      ],
    );
  }
}
