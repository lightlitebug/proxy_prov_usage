import 'package:flutter/material.dart';
import 'package:proxy_prov_usage/pages/mp_cnp_cnpp.dart';
import 'package:proxy_prov_usage/pages/mp_cnp_pp.dart';
import 'package:proxy_prov_usage/pages/mp_pp_pp.dart';
import 'package:proxy_prov_usage/pages/pp_create_update.dart';
import 'package:proxy_prov_usage/pages/pp_update.dart';
import 'package:proxy_prov_usage/pages/why_proxy_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProxyProvider Usages'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return WhyProxyProvider();
                    }),
                  );
                },
                child: Text(
                  'Why ProxyProvider',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PpUpdate();
                    }),
                  );
                },
                child: Text(
                  'ProxyProvider Update',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PpCreateUpdate();
                    }),
                  );
                },
                child: Text(
                  'ProxyProvider Create,Update',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MPPpPp();
                    }),
                  );
                },
                child: Text(
                  'Two ProxyProviders',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MpCnpCnpp();
                    }),
                  );
                },
                child: Text(
                  'ChangeNotifierProvider,\nChangeNotifierProxyProvider',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return MpCnpPp();
                    }),
                  );
                },
                child: Text(
                  'ChangeNotifierProvider,\nProxyProvider',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
