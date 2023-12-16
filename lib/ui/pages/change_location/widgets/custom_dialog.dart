import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    required this.model,
  });

  final MapModel model;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.model.address);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextField(
                  controller: _controller,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Orqaga"),
              ),
              TextButton(
                onPressed: () async {
                  await Hive.box("locations").put(
                    widget.model.id,
                    widget.model.copyWith(address: _controller.text),
                  );
                  if (mounted) Navigator.pop(context);
                },
                child: const Text("Saqlash"),
              )
            ],
          ),
        ],
      ),
    );
  }
}