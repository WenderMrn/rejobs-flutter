import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef StringCallback = void Function(String);

class JobFilter extends StatefulWidget {
  final VoidCallback onAdvancedSearch;
  final StringCallback onSubmit;

  const JobFilter(
      {Key key, @required this.onAdvancedSearch, @required this.onSubmit})
      : super(key: key);

  @override
  _JobFilterState createState() => _JobFilterState();
}

class _JobFilterState extends State<JobFilter> {
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
            labelText: "Search a job",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.filter_alt_outlined, color: Colors.teal),
              onPressed: () => this.widget.onAdvancedSearch(),
            )),
        onSubmitted: (text) => {this.widget.onSubmit(text)},
      ),
    );
  }
}
