import 'package:flutter/material.dart';
import 'package:movingacard/providers/files.dart';
import 'package:provider/provider.dart';

class FilesHomeScreen extends StatelessWidget {
  FilesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final files = Provider.of<Files>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Files', style: Theme.of(context).textTheme.bodyLarge!.copyWith(

        ),),
      ),
      body: ListView(
        children: files
            .map(
              (e) => ListTile(
                title: Text(e.title),
                subtitle: Text(e.date),
                trailing: Text(e.quantity.toString()),
                onTap: () {

                  Navigator.of(context)
                      .pushNamed('/file_detailed', arguments: e.title);
                },
              ),
            )
            .toList(),
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
