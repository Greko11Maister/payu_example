import 'package:flutter/material.dart';
import 'package:payu_example/entities/payu_parameters.dart';
import 'package:payu_example/payu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var infoPago = PayUParametersModel.fromJson({
      "merchantId": "508029",
      "extra1": 33302,
      "accountId": "512321",
      "description": "Pago en Linea PayU",
      "referenceCode": "Pago33302",
      "tax": "0",
      "taxReturnBase": "0",
      "currency": "COP",
      "amount": 35750,
      "signature": "97bc9e11236527819a445678e6fe6f45",
      "test": 1,
      "buyerEmail": "greko11maister@gmail.com",
      "buyerFullName": "Gregory Iscala",
      "responseUrl": "https://tienda.leeche.app/tendero/carrito?payu=1",
      "confirmationUrl":
      "https://test.leeche.app/api/pagos/cliente/confirmacion-pago",
      "dataBase": "leeche_sandbox"
    });
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: GatewayPayUWebViewPage(
        /*infoPago: PayUParameters(
            merchantId: '508029',
            accountId: '515321',
            description: 'Pago en Linea PayU',
            referenceCode: "Pago33302",
            tax: "0",
            taxReturnBase: "0",
            currency: "COP",
            amount: 35750,
            extra1: 33302,
            signature: "97bc9e11236527819a445678e6fe6f45",
            test: 1,
            buyerEmail: "greko11maister@gmail.com",
            buyerFullName: "Usuario Prueba",
            responseUrl: "https://tienda.leeche.app/tendero/carrito?payu=1",
            confirmationUrl: "https://test.leeche.app/api/pagos/cliente/confirmacion-pago"),*/
        infoPago: infoPago,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
