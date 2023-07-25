import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wazirx_using_gorouter/routes/config.dart';
import '../data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...stocks
                .map((e) => ListTile(
              title: Text(e.name),
              trailing: Text(e.price.toString()),
              onTap: () {
                GoRouter.of(context).pushNamed('detail',pathParameters: {'id' : stocks.indexOf(e).toString()});
              },
            ))
                .toList(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed('login');
                },
                child: Text( AppConfig.isAuthenticated ? ' Go To Log Out Page' : 'Go To Log In Page'),
              ),
            )
          ],
        ),
      ),
    );
  }
}