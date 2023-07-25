import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wazirx_using_gorouter/data.dart';
import 'package:wazirx_using_gorouter/screens/home_page.dart';
import 'package:wazirx_using_gorouter/screens/stock_detail_page.dart';

import '../screens/login_page.dart';

class AppConfig {

  static bool isAuthenticated = false;

  static GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
          name: 'home',
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MyHomePage());
          }),
      GoRoute(
          name: 'detail',
          path: '/detail/:id',
          pageBuilder: (context, state) {
            int id = int.parse(state.pathParameters['id'].toString());
            return MaterialPage(
                child: StockDetailPage(
              stock: stocks[id],
                ));
          }),
      GoRoute(
          name: 'login',
          path: '/login',
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          }),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
          child: Scaffold(
            appBar: AppBar(
              title:const Text('Error Page'),
            ),
            body: const Center(
              child: Text('Error 404'),
            ),
          ));
    },

    redirect: (context,state){
      debugPrint('${state.location}, isAuth : ${isAuthenticated},  redirectToLogin : ${!isAuthenticated && state.location.startsWith('/profile')} ');

      if(!isAuthenticated && state.location.startsWith('/detail')){
        return '/login';
      }

    },

  );
}
