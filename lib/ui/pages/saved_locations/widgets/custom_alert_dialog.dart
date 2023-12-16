import 'package:flutter/material.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.data,
  });

  final MapModel data;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Text(
        "Ma'lumotlar o'chirilsinmi?",
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await data.delete();
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text("Ha"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Yo'q"),
        ),
      ],
    );
  }
}
