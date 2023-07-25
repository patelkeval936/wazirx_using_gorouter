
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wazirx_using_gorouter/routes/config.dart';

class LoginPage extends StatefulWidget {
  final int? id;
  const LoginPage({ Key? key,  this.id}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      AppConfig.isAuthenticated = !AppConfig.isAuthenticated;
                    });
                    if(widget.id != null && AppConfig.isAuthenticated){
                      GoRouter.of(context).pushNamed('detail',pathParameters: {'id' : widget.id.toString()});
                    }
                  },
                  child: Text(AppConfig.isAuthenticated ? 'Log Out ' : 'Log In')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Pop')),
            ),
          ],
        ),
      ),
    );
  }
}