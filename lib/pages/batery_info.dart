import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BateryInfo extends StatefulWidget {
  const BateryInfo({required key}) : super(key: key);

  @override
  _BateryInfoState createState() => _BateryInfoState();
}

class _BateryInfoState extends State<BateryInfo> {
  String _batteryLevel = 'Unknown battery level';
  static const platform = const MethodChannel('samples.flutter.io/battery');

  Future<void> _getBatteryLevel() async {
    String batteryLevel = '';
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
      print('error');
    } on Exception catch (e) {
      print(e.toString());
      batteryLevel = e.toString();
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _getBatteryLevel,
                child: Text(
                  'Request battery info',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  _batteryLevel,
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
