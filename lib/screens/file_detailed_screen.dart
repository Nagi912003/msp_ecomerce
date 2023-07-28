import 'package:flutter/material.dart';
import 'package:movingacard/providers/files.dart';
import 'package:provider/provider.dart';

class FileDetailedScreen extends StatelessWidget {
  const FileDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fileTitle = ModalRoute.of(context)!.settings.arguments as String;
    final files = Provider.of<Files>(context);
    final file = files.findByTitle(fileTitle);
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Detailed'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(file.title),
            Text(file.date),
            Text(file.quantity.toString()),
            IconButton(
              onPressed: () {
                files.toggleFavoriteStatusByTitle(file.title);
              },
              icon: file.isFavorite == true
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
            ),
          ],
        ),
      ),
    );
  }
}
