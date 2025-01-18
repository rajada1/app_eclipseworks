import 'package:app_eclipseworks/domain/models/apod_model.dart';
import 'package:app_eclipseworks/ui/core/shared_widgets/see_apod_details_btn.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebViewVideo extends StatelessWidget {
  final ApodModel item;

  const WebViewVideo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      floatingActionButton: SeeApodDetailsBtn(
        date: item.date,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        launchUrlString(item.url!);
                      },
                      child: Text('Clique para abrir no navegador'))),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    '${item.title} - ${item.date}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${item.explanation}',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
