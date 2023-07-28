import 'package:flutter/material.dart';
import 'package:movingacard/providers/files.dart';
import 'package:provider/provider.dart';

class FilesHomeScreen extends StatelessWidget {
  const FilesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final files = Provider.of<Files>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Files'),
      ),
      body:

      ListView(
        children:
          files.map((e) =>
         ListTile(
            title: Text(e.title),
            subtitle: Text(e.date),
            trailing: Text(e.quantity.toString()),
            onTap: (){
              Navigator.of(context).pushNamed('/file_detailed',arguments: e.title);
            },
          ),
          ).toList(),

      ),

      // ListView.builder(
      //   itemCount: files.length,
      //
      //   itemBuilder: (context,index) => ListTile(
      //     title: Text(files[index].title),
      //     subtitle: Text(files[index].date),
      //     trailing: Text(files[index].quantity.toString()),
      //   ),
      // ),
    );
  }
}
