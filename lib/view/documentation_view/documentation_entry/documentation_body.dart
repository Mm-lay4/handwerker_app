import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handwerker_app/constants/apptheme/app_colors.dart';
import 'package:handwerker_app/constants/globals.dart';
import 'package:handwerker_app/provider/dokumentation_provider.dart';
import 'package:handwerker_app/view/widgets/symetric_button_widget.dart';
import 'package:handwerker_app/view/widgets/textfield_widgets/labeld_textfield.dart';

class DokumentationBody extends ConsumerStatefulWidget {
  const DokumentationBody({super.key});

  @override
  ConsumerState<DokumentationBody> createState() => _DokumentationBodyState();
}

class _DokumentationBodyState extends ConsumerState<DokumentationBody> {
  final TextEditingController _dayPickerController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  static const customerProject = [
    'Wählen',
    'Koch / Fenster Montage',
    'Meier/ Bad verfliesen',
    'Berger/ Putzen',
  ];
  // static const services = ['Wählen', 'Fenster Montage', 'Bad fliesen', 'Reinigung'];
  String _project = customerProject.first;
  // String _executedService = services.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      final savedData = ref.watch(dokuProvider);
      if (savedData.isNotEmpty) {
        final startDate =
            savedData.where((element) => element.containsKey('start')).first.values.toList();
        log(startDate.toString());
      }
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Column(
          children: [
            _dayInputWidget(),
            _buildCustomerProjectField(),
            _buildChooseMedai(),
            _buildDescription(),
            const SizedBox(height: 8),
            _submitInput(),
            SizedBox(
              child: Image.asset('assets/images/img_techtool.png', height: 70),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildChooseMedai() {
    return Container(
      height: 170,
      width: 500,
      decoration: BoxDecoration(
        color: AppColor.kTextfieldBorder,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Foto machen'),
              IconButton(
                icon: const Icon(Icons.camera_alt, size: 75),
                onPressed: () {
                  ref.read(dokuProvider);
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Bild wählen'),
              IconButton(
                icon: const Icon(Icons.image, size: 70),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: LabeledInputWidget(
        label: 'BESCHREBUNG',
        child: SizedBox(
          height: 80,
          child: TextField(
            controller: _descriptionController,
            textAlignVertical: TextAlignVertical.top,
            expands: true,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColor.kTextfieldBorder,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.kBlue),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _submitInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SymetricButton(
        color: AppColor.kPrimaryColor,
        text: 'Eintrag erstellen',
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        onPressed: () {
          // if (_startController.text.isEmpty || _endController.text.isEmpty) {
          //   return ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //       content: Text('Bitte gib Start und eine Endzeit an'),
          //     ),
          //   );
          // } else if (_project == 'Wählen' || _executedService == 'Wählen') {
          //   return ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //       content: Text('Bitte wähle einen Kunde/Projekt und eine Leistung'),
          //     ),
          //   );
          // } else {
          //   final execution = _createExecution();
          //   collection.saveStart(start: execution.start);
          //   collection.saveDescription(description: execution.descritpion);
          //   collection.saveProject(project: execution.project);
          //   collection.saveEnd(end: execution.end);
          //   collection.saveService(service: execution.service);
          //   collection.saveUser(users: execution.users);
          // }
        },
      ),
    );
  }

  Padding _buildCustomerProjectField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: LabeledInputWidget(
        label: 'KUNDE/PROJEKT',
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColor.kTextfieldBorder),
          ),
          child: DropdownButton(
            underline: const SizedBox(),
            isExpanded: true,
            value: _project,
            items: customerProject
                .map(
                  (e) => DropdownMenuItem(value: e, child: Text(e)),
                )
                .toList(),
            onChanged: (e) {
              setState(() => _project = e!);
            },
          ),
        ),
      ),
    );
  }

  Widget _dayInputWidget() {
    return LabeledInputWidget(
        label: 'TAG',
        child: TextField(
          controller: _dayPickerController,
          keyboardType: TextInputType.datetime,
          onTap: () async {
            final date = await Utilits.selecetDate(context);
            if (date != null) {
              setState(() {
                _dayPickerController.text = '${date.day}.${date.month}.${date.year}';
              });
            }
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.kTextfieldBorder),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColor.kBlue))),
        ));
  }
}
