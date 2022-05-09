import 'package:flutter/material.dart';

class TemplateMainWidget extends StatefulWidget {
  final Widget body;
  final String title;

  const TemplateMainWidget({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);

  @override
  _TemplateMainWidgetState createState() => _TemplateMainWidgetState();
}

class _TemplateMainWidgetState extends State<TemplateMainWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: widget.body,
      );
}
