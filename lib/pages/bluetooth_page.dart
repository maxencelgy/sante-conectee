import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> devices = [];
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
  }

  void scanForDevices() {
    flutterBlue.scan(timeout: Duration(seconds: 5)).listen((scanResult) {
      if (!devices.contains(scanResult.device)) {
        setState(() {
          devices.add(scanResult.device);
        });
      }
    });
  }

  void startScan() {
    setState(() {
      isScanning = true;
      devices.clear();
    });

    flutterBlue.stopScan();
    scanForDevices();

    Future.delayed(Duration(seconds: 5), () {
      stopScan();
    });
  }

  void stopScan() {
    setState(() {
      isScanning = false;
    });

    flutterBlue.stopScan();
  }

  void connectToDevice(BluetoothDevice device) async {
    await device.connect();
    // Do something with the connected device
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text(isScanning ? 'Scanning...' : 'Scan for devices'),
            onPressed: isScanning ? null : startScan,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(devices[index].name),
                  subtitle: Text(devices[index].id.toString()),
                  trailing: ElevatedButton(
                    child: Text('Connect'),
                    onPressed: () => connectToDevice(devices[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
