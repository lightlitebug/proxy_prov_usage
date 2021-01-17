import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Translations {
  int value;

  void update(int newValue) {
    value = newValue;
  }

  String get title => 'You clicked $value times';
}

class PpCreateUpdate extends StatefulWidget {
  @override
  _PpCreateUpdateState createState() => _PpCreateUpdateState();
}

class _PpCreateUpdateState extends State<PpCreateUpdate> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProxyProvider Create, Update'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Work?',
              style: TextStyle(fontSize: 36.0),
            ),
            SizedBox(height: 20.0),
            ProxyProvider0<Translations>(
              create: (_) => Translations(),
              update: (_, translations) {
                translations.update(count);
                return translations;
              },
              child: Column(
                children: [
                  ShowTranslations(),
                  SizedBox(height: 20.0),
                  IncreaseButton(increment),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IncreaseButton extends StatelessWidget {
  final VoidCallback increment;

  const IncreaseButton(this.increment);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'INCREASE',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: increment,
    );
  }
}

class ShowTranslations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = Provider.of<Translations>(context).title;

    return Text(
      title,
      style: TextStyle(fontSize: 24.0),
    );
  }
}
