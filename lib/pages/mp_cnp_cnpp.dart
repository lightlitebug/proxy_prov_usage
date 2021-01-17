import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class Translations with ChangeNotifier {
  int value;

  void update(Counter counter) {
    value = counter.count;
    notifyListeners();
  }

  String get title => 'You clicked $value times';
}

class MpCnpCnpp extends StatefulWidget {
  @override
  _MpCnpCnppState createState() => _MpCnpCnppState();
}

class _MpCnpCnppState extends State<MpCnpCnpp> {
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
            MultiProvider(
              providers: [
                ChangeNotifierProvider<Counter>(
                  create: (_) => Counter(),
                ),
                ChangeNotifierProxyProvider<Counter, Translations>(
                  create: (_) => Translations(),
                  update: (_, counter, translations) {
                    translations.update(counter);
                    return translations;
                  },
                ),
              ],
              child: Column(
                children: [
                  ShowTranslations(),
                  SizedBox(height: 20.0),
                  IncreaseButton(),
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
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'INCREASE',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Provider.of<Counter>(context, listen: false).increment();
      },
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
