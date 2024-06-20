import 'package:flutter/material.dart';
import 'package:to_do_app/constants/text.dart';
import 'package:to_do_app/models/chore.dart';

class NewChoreScreen extends StatelessWidget {
  const NewChoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        foregroundColor: colors.onBackground,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Сохранить'.toUpperCase(),
                style: TextOption.getCustomStyle(
                    style: TextStyles.button, color: Colors.blue)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const DescriptionWidget(),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: PriorityWidget(),
            ),
            Divider(color: colors.onSurface),
            const ChoseDateWidget(),
            Divider(color: colors.onSurface),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline),
                label: const Text('Удалить')),
          ],
        ),
      ),
    );
  }
}

class ChoseDateWidget extends StatelessWidget {
  const ChoseDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Сделать до'),
        Switch(value: false, onChanged: ((value) {})),
      ],
    );
  }
}

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DropdownMenu(
        label: const Text('Важность'),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          labelStyle: TextOption.getCustomStyle(
              style: TextStyles.subtitle, color: colors.onBackground),
        ),
        // helperText: 'Важность',
        enableSearch: false,
        menuStyle: MenuStyle(
          surfaceTintColor:
              MaterialStateColor.resolveWith((states) => colors.surface),
          alignment: AlignmentDirectional.topStart,
        ),
        trailingIcon:
            const Icon(Icons.arrow_drop_down, color: Colors.transparent),
        initialSelection: Priority.none,
        dropdownMenuEntries: Priority.values
            .map((e) => DropdownMenuEntry(value: e, label: e.name))
            .toList());
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return TextField(
      maxLines: null,
      minLines: 5,
      style: TextOption.getCustomStyle(
          style: TextStyles.body, color: colors.onBackground),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: colors.surface,
        hintText: 'Что надо сделать...',
        hintStyle: TextOption.getCustomStyle(
            style: TextStyles.body, color: colors.onSurface),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
