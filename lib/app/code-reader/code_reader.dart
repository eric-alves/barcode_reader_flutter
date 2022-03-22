import 'package:flutter/material.dart';

class CodeReader extends StatefulWidget {
  const CodeReader({Key? key}) : super(key: key);

  @override
  State<CodeReader> createState() => _CodeReaderState();
}

class _CodeReaderState extends State<CodeReader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.qr_code),
              label: Text("Abrir leitor"),
            )
          ],
        ),
      ),
    );
  }
}
