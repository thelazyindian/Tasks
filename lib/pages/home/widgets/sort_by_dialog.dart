import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/models/sort_by.dart';

class SortByDialog extends StatelessWidget {
  const SortByDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeTaskList = context.read<HomeBloc>().state.activeTaskList!;
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 16.0, 16.0, 8.0),
              child: Text(
                'Sort by',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...SortBy.values
                .map(
                  (e) => RadioListTile<SortBy>(
                    value: e,
                    title: Text(sortByString[e]!),
                    toggleable: true,
                    groupValue: activeTaskList.sortBy,
                    onChanged: (value) {
                      if (value != null) {
                        context.read<HomeBloc>().add(HomeEvent.sortBy(value));
                      }
                      Navigator.pop(context);
                    },
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
