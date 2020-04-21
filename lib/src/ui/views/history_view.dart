import 'package:flutter/material.dart';
import 'package:homathon_project/src/providers/history_provider.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/provider_architecture.dart';

class HistoryView extends StatefulWidget {
  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => HistoryProvider(),
      builder: (
        BuildContext context,
        HistoryProvider provider,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: Text(
                'History View',
                style: TextStyle(
                  fontSize: blockSizeHorizontal(context) * 7,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
