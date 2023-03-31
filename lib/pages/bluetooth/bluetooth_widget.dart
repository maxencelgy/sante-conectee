import 'package:breath_meditation/index.dart';
import 'package:breath_meditation/main.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bluetooth_model.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
export 'bluetooth_model.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothWidget extends StatefulWidget {
  const BluetoothWidget({Key? key}) : super(key: key);

  @override
  _BluetoothWidgetState createState() => _BluetoothWidgetState();
}

class _BluetoothWidgetState extends State<BluetoothWidget> {
  late BluetoothModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final _ble = FlutterReactiveBle();
  List<String> _devicesUuids = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BluetoothModel());
  }

  @override
  void dispose() {
    _model.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  Future<void> _requestLocationPermission() async {
    final permissionStatus = await Permission.locationWhenInUse.status;
    if (permissionStatus != PermissionStatus.granted) {
      final status = await Permission.locationWhenInUse.request();
      if (status != PermissionStatus.granted) {
        throw Exception('Location permission not granted');
      }
    }
  }
  Future<void> _requestLocationBluetooth() async {
    final permissionStatus = await Permission.bluetooth.status;
    if (permissionStatus != PermissionStatus.granted) {
      final status = await Permission.bluetooth.request();
      if (status != PermissionStatus.granted) {
        throw Exception('Bluetooth permission not granted');
      }
    }
  }


  Future<void> _scanDevices() async {
    final status = await Permission.location.status;
    final statusBlue = await Permission.bluetoothScan.status;
    if (status.isDenied) {
      await _requestLocationPermission();
    }
    if (statusBlue.isDenied) {
      await _requestLocationBluetooth();
    }
    try {
      final scanResults = await _ble.scanForDevices(withServices: []);
      setState((){
        _devicesUuids = scanResults.map((device) => device.id.toString()).toList() as List<String>;
        debugPrint(_devicesUuids.toString());
      });
    } catch (error) {
      print('Error scanning for devices: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          child: Text(
            'Bluetooth',
            style: FlutterFlowTheme.of(context).title2.override(
              fontFamily: 'Fira Sans Condensed',
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: _scanDevices,
                child: const Text('Scan devices'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _devicesUuids.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Device ${index + 1}'),
                      subtitle: Text(_devicesUuids[index]),
                      onTap: () {
                        // Do something when device is tapped
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
