import 'package:flutter/material.dart';

void main() => runApp(CoffeeShellApp());

class CoffeeShellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Coffee Dispenser',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF7F1E1),
        primarySwatch: Colors.brown,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[700],
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: CoffeeHomePage(),
    );
  }
}

class CoffeeHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> drinks = [
    {"label": "No Sugar", "icon": Icons.no_food},
    {"label": "Extra Sugar", "icon": Icons.add},
    {"label": "Black Coffee", "icon": Icons.coffee},
    {"label": "White Coffee", "icon": Icons.coffee_maker},
    {"label": "Cappuccino", "icon": Icons.local_cafe},
    {"label": "Hot Chocolate", "icon": Icons.emoji_food_beverage},
    {"label": "White Tea", "icon": Icons.local_drink},
    {"label": "Mochaccino", "icon": Icons.emoji_food_beverage},
  ];

  void onCommandPressed(BuildContext context, String drink) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Selected: $drink")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.local_cafe, color: Colors.white),
            SizedBox(width: 10),
            Text('Nescafé Alegria'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemCount: drinks.length,
          itemBuilder: (context, index) {
            final drink = drinks[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.brown[300],
              child: InkWell(
                onTap: () => onCommandPressed(context, drink['label']),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(drink['icon'], size: 40, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        drink['label'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
