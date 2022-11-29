import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sort_app/view_models/sort_view_model.dart';

class SortResultView extends StatelessWidget {
  const SortResultView({super.key});

  @override
  Widget build(BuildContext context) {
    SortViewModel sortFormViewModel = context.watch<SortViewModel>();

    final text =
        ModalRoute.of(context)!.settings.arguments as TextEditingController;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sortFormViewModel.textfieldString),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    text.clear();
                  },
                  child: const Text('New'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
