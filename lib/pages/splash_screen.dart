import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Medec',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 50,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}