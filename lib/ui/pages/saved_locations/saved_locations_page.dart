import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_for_job/common/config/route.dart';
import 'package:task_for_job/common/constants/colors.dart';

class SavedLocationsPage extends StatelessWidget {
  const SavedLocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Xaritadan tanlash",
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.changeLocation,
                  );
                },
              ),
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
                        return ListView.builder(
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            final data = box.getAt(index);
                            return ListTile(
                              title: Text(
                                data,
                                style: const TextStyle(
                                  color: AppColors.white,
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
