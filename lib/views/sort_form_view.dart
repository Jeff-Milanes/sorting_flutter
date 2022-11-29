import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sort_app/common/constant/route_names.dart';
import 'package:sort_app/models/sort_model.dart';
import 'package:sort_app/view_models/sort_view_model.dart';

class SortFormView extends StatefulWidget {
  const SortFormView({super.key});

  @override
  State<SortFormView> createState() => _SortFormViewState();
}

class _SortFormViewState extends State<SortFormView> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SortViewModel sortFormViewModel = context.watch<SortViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort Form Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _text,
              decoration: InputDecoration(
                labelText: 'Enter Characters',
                errorText: _validate ? 'Textfield cannot be empty' : null,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Text('Sort by:'),
                    const SizedBox(width: 8.0),
                    DropdownButton<SortModel>(
                      value: sortFormViewModel.currentSort,
                      items: SortModel.values
                          .map<DropdownMenuItem<SortModel>>((SortModel value) {
                        return DropdownMenuItem<SortModel>(
                          value: value,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          sortFormViewModel.setCurrentSort(value!),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _text.text.isEmpty ? _validate = true : _validate = false;
                    });

                    if (!_validate) {
                      sortFormViewModel.setTextFieldString(_text.text);
                      Navigator.pushNamed(context, RouteNames.sort,
                          arguments: _text);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
