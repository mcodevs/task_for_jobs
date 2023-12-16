import 'package:flutter/material.dart';
import 'package:task_for_job/common/config/route.dart';
import 'package:task_for_job/common/constants/colors.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';

class CustomEditDialog extends StatefulWidget {
  const CustomEditDialog({
    required this.data,
    super.key,
  });

  final MapModel data;

  @override
  State<CustomEditDialog> createState() => _CustomEditDialogState();
}

class _CustomEditDialogState extends State<CustomEditDialog> {
  late final TextEditingController _controller;
  Object? mapModel;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.data.address);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  static const _border = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.black,
      width: 5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              enabledBorder: _border,
              focusedBorder: _border,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text("Manzilni o'zgartirish"),
            shape: _border,
            onTap: () async {
              mapModel = await Navigator.pushNamed(
                context,
                AppRoutes.changeLocation,
              );
            },
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            if(mapModel != null && mapModel is MapModel) {
              widget.data.latitude = (mapModel as MapModel).latitude;
              widget.data.longitude = (mapModel as MapModel).longitude;
              await widget.data.save();

            }
            if(_controller.text != widget.data.address) {
              widget.data.address = _controller.text;
              await widget.data.save();
            }
            if(mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text("Saqlash"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Bekor qilish"),
        ),
      ],
    );
  }
}