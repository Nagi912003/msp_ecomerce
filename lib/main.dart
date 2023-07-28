import 'package:flutter/material.dart';
import 'package:movingacard/providers/files.dart';
import 'package:movingacard/providers/products.dart';
import 'package:movingacard/screens/file_detailed_screen.dart';
import 'package:movingacard/screens/files_home_screen.dart';
import 'package:provider/provider.dart';

import 'package:movingacard/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Files(),
        ),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            useMaterial3: true,
            // brightness: Brightness.dark,

              textTheme: const TextTheme(
                titleLarge: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),


              // colorScheme: ColorScheme.fromSwatch(
              //   primarySwatch: Colors.blue,
              //   accentColor: Colors.blueAccent,
              //   cardColor: Colors.blueGrey,
              //   backgroundColor: Colors.blueGrey,
              //   errorColor: Colors.red,
              //   brightness: Brightness.light,
              // ),




            )
          ),
          home: FilesHomeScreen(),
        routes: {
          '/file_detailed': (ctx) => const FileDetailedScreen(),
        },
        ),
    );
  }
}
















































































class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          DraggableWidget(),
          DraggableWidget(),
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({super.key});

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset _offset = const Offset(0, 0);
  final String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _offset.dx,
          top: _offset.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _offset = Offset(
                  _offset.dx + details.delta.dx,
                  _offset.dy + details.delta.dy,
                );
              });
            },
            child: Container(
              width: 200,
              height: 250,
              color: Colors.red,
              child: const Center(
                child: Card(
                  child: Text('  '),
                ), //Image.network(widget.imageUrl,),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
