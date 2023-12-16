import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_for_job/common/config/route.dart';
import 'package:task_for_job/common/constants/colors.dart';
import 'package:task_for_job/ui/pages/change_location/models/map_model.dart';
import 'package:task_for_job/ui/pages/change_location/widgets/custom_elevated_button.dart';
import 'package:task_for_job/ui/pages/saved_locations/cubit/saved_cubit.dart';
import 'package:task_for_job/ui/pages/saved_locations/widgets/custom_alert_dialog.dart';
import 'package:task_for_job/ui/pages/saved_locations/widgets/custom_edit_dialog.dart';

class SavedLocationsPage extends StatefulWidget {
  const SavedLocationsPage({super.key});

  @override
  State<SavedLocationsPage> createState() => _SavedLocationsPageState();
}

class _SavedLocationsPageState extends State<SavedLocationsPage> {
  late final SavedCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = SavedCubit();
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              StreamBuilder<SavedState>(
                  stream: _cubit.stream.asBroadcastStream(),
                  initialData: _cubit.state,
                  builder: (context, snapshot) {
                    final state = snapshot.data!;
                    return ListTile(
                      title: Text(
                        state.maybeMap(
                          orElse: () => "Xaritadan tanlash",
                          success: (value) => value.address.address,
                        ),
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                      trailing: Icon(
                        state.maybeMap(
                          orElse: () => Icons.chevron_right,
                          success: (value) => Icons.check,
                        ),
                        color: AppColors.white,
                      ),
                      onTap: () async {
                        final address = await Navigator.pushNamed(
                          context,
                          AppRoutes.changeLocation,
                        );
                        if (address != null && address is MapModel) {
                          _cubit.addSuccess(address);
                        }
                      },
                    );
                  }),
              const Divider(color: AppColors.white),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: Hive.box("locations").listenable(),
                  builder: (context, box, child) {
                    if (box.isEmpty) {
                      return const Center(
                        child: Text(
                          "Saqlangan joylar yo'q",
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      );
                    } else {
                      return StreamBuilder<SavedState>(
                        stream: _cubit.stream.asBroadcastStream(),
                        initialData: _cubit.state,
                        builder: (context, snapshot) {
                          final state = snapshot.data!;
                          return ListView.builder(
                            itemCount: box.length,
                            itemBuilder: (context, index) {
                              final data = box.getAt(index) as MapModel;
                              return ListTile(
                                title: Text(
                                  data.address,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                                leading: PopupMenuButton(
                                  iconColor: AppColors.white,
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        child: const Text("Tahrirlash"),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CustomEditDialog(
                                                data: data,
                                              );
                                            },
                                          );
                                          _cubit.addSuccessSaved(data);
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: const Text("O'chirish"),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CustomAlertDialog(
                                                data: data,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ];
                                  },
                                ),
                                trailing: state.maybeMap(
                                  orElse: () => null,
                                  successSaved: (value) =>
                                      value.address.id == data.id
                                          ? const Icon(
                                              Icons.check,
                                              color: AppColors.white,
                                            )
                                          : null,
                                ),
                                onTap: () => _cubit.addSuccessSaved(data),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              StreamBuilder<SavedState>(
                  stream: _cubit.stream.asBroadcastStream(),
                  initialData: _cubit.state,
                  builder: (context, snapshot) {
                    final state = snapshot.data!;
                    return Visibility(
                      visible: state.maybeMap(
                        orElse: () => true,
                        initial: (value) => false,
                      ),
                      child: CustomElevatedButton(
                        childText: "Tasdiqlash",
                        onPressed: () {
                          state.maybeMap(
                            orElse: () {
                              Navigator.pop(context);
                            },
                            successSaved: (value) =>
                                Navigator.pop(context, value.address),
                            success: (value) =>
                                Navigator.pop(context, value.address),
                          );
                        },
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
