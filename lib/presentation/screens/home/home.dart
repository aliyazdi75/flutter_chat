import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  // const HomePage({
  //   @required this.Repository,
  //   @required this.Repository,
  // })  : assert(Repository != null),
  //       assert(Repository != null);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('You are authenticated!')),
    );
  }
}
