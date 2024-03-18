// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handwerker_app/constants/apptheme/app_colors.dart';
import 'package:handwerker_app/constants/utiltis.dart';
import 'package:handwerker_app/models/project_models/project_dm/project_entry.dart';
import 'package:handwerker_app/models/project_models/project_vm/project.dart';
import 'package:handwerker_app/provider/doku_provider/project_provider.dart';
import 'package:handwerker_app/provider/language_provider/language_provider.dart';
import 'package:handwerker_app/view/widgets/symetric_button_widget.dart';
import 'package:handwerker_app/view/widgets/textfield_widgets/labeld_textfield.dart';

class ProjectBody extends ConsumerStatefulWidget {
  const ProjectBody({super.key});

  @override
  ConsumerState<ProjectBody> createState() => _ProjectBodyState();
}

class _ProjectBodyState extends ConsumerState<ProjectBody> {
  final TextEditingController _dayPickerController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late ProjectEntry _entry;

  ProjectVM? _project;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    setState(() {
      _dayPickerController.text = '${now.day}.${now.month}.${now.year}';
      _entry = ProjectEntry(
          createDate: now, projectID: BigInt.one, customerID: BigInt.from(0), customerName: '');
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            _dayInputWidget(),
            _buildCustomerProjectField(),
            _buildChooseMedai(),
            _buildDescription(),
            const SizedBox(height: 38),
            _submitInput(),
            SizedBox(
              height: 70,
              child: Center(
                child: Image.asset('assets/images/img_techtool.png', height: 20),
              ),
            ),
          ],
        ),
      );

  Container _buildChooseMedai() => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        height: 150,
        decoration: BoxDecoration(
          color: AppColor.kTextfieldBorder,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ref.watch(languangeProvider).makePicture),
                    IconButton(
                      icon: const Icon(Icons.camera_alt, size: 75),
                      onPressed: () async {
                        final image =
                            await Utilits.pickImageFromCamera(context, _project?.title ?? '');
                        if (image != null) {
                          log('image was successfully convert to Base64');
                          //TODO: Maybe show image in popUp?
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                ref.watch(languangeProvider).pictureSucces,
                              ),
                              backgroundColor: AppColor.kPrimaryButtonColor,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Image.file(
                              File(image),
                              height: 100,
                              width: 100,
                            ),
                          ));
                          setState(() {
                            _entry = _entry.copyWith(
                              imageUrl: [image],
                            );
                          });
                        }
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ref.watch(languangeProvider).takePicture),
                    IconButton(
                      icon: const Icon(Icons.image, size: 70),
                      onPressed: () async {
                        final image =
                            await Utilits.pickImageFromGalery(context, _project?.title ?? '');
                        if (image != null) {
                          log('image are successfully translate to Base64');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                ref.watch(languangeProvider).pictureSucces,
                                style: TextStyle(
                                  color: AppColor.kPrimaryButtonColor,
                                ),
                              ),
                              backgroundColor: AppColor.kPrimaryButtonColor,
                            ),
                          );
                          setState(() {
                            _entry = _entry.copyWith(
                              imageUrl: [image],
                            );
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            Text(
              _entry.imageUrl.isEmpty
                  ? ''
                  : '${_entry.imageUrl.length} ${ref.watch(languangeProvider).choosedImage}',
              style: _entry.imageUrl.isEmpty
                  ? const TextStyle(fontSize: 0)
                  : Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      );

  Widget _buildCustomerProjectField() {
    return ref.read(projectProvider).when(
          error: (error, stackTrace) => const SizedBox(
            child: Text('please restart App'),
          ),
          loading: () => const CircularProgressIndicator.adaptive(),
          data: (data) {
            if (data == null) {
              ref.read(projectProvider.notifier).loadpProject();
            }
            final projects = data;
            if (projects != null) {
              _project = projects.first;
              _entry = _entry.copyWith(
                projectID: BigInt.from(projects.first.id),
                projectName: projects.first.title,
                customerID: BigInt.from(projects.first.id),
                customerName: projects.first.title,
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: LabeledInputWidget(
                label: ref.watch(languangeProvider).customerProject,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.kTextfieldBorder),
                  ),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: true,
                    value: _project,
                    items: projects
                        ?.map(
                          (e) => DropdownMenuItem(value: e, child: Text(' ${e.title}')),
                        )
                        .toList(),
                    onChanged: (e) {
                      setState(() {
                        _project = e!;
                        _entry = _entry.copyWith(
                          projectID: BigInt.from(e.id),
                          customerID: BigInt.from(e.id),
                          projectName: e.title,
                          customerName: e.title,
                        );
                      });
                    },
                  ),
                ),
              ),
            );
          },
        );
  }

  Padding _buildDescription() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: LabeledInputWidget(
          label: ref.watch(languangeProvider).description,
          child: SizedBox(
            height: 80,
            child: TextField(
              controller: _descriptionController,
              textAlignVertical: TextAlignVertical.top,
              expands: true,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              maxLines: null,
              decoration: Utilits.textFieldDecorator(context),
              onChanged: (value) {
                _descriptionController.text = value;
                _entry = _entry.copyWith(description: value);
              },
            ),
          ),
        ),
      );

  Widget _dayInputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: LabeledInputWidget(
        label: ref.watch(languangeProvider).date,
        child: TextField(
          controller: _dayPickerController,
          keyboardType: TextInputType.datetime,
          onTap: () async {
            final date = await Utilits.selecetDate(context);
            if (date != null) {
              setState(() {
                _dayPickerController.text = '${date.day}.${date.month}.${date.year}';
                _entry = _entry.copyWith(createDate: date);
              });
            }
          },
          decoration: Utilits.textFieldDecorator(context),
        ),
      ),
    );
  }

  Padding _submitInput() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SymmetricButton(
          color: AppColor.kPrimaryButtonColor,
          text: ref.watch(languangeProvider).createEntry,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          onPressed: () {
            if (_entry.imageUrl.isEmpty) {
              log((_entry.toJson().toString()));
            }
            if (_dayPickerController.text.isEmpty) {
              return ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(ref.watch(languangeProvider).plsChooseDay),
                ),
              );
              // } else if (_project != null && _project!.title == ' Wählen') {
              //   return ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: Text(ref.watch(languangeProvider).plsChooseProject),
              //     ),
              //   );
            }
            if (_dayPickerController.text.isNotEmpty) {
              ref.read(projectProvider.notifier).uploadProjectEntry(_entry);
              final now = DateTime.now();
              setState(() {
                _descriptionController.clear();
                _dayPickerController.text = '${now.day}.${now.month}.${now.year}';
                _entry = ProjectEntry(
                    projectID: BigInt.from(_project!.id),
                    customerID: BigInt.from(_project!.id),
                    customerName: _project!.title,
                    projectName: null,
                    imageUrl: [],
                    description: null,
                    createDate: DateTime.now());
              });
              return ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(ref.watch(languangeProvider).succes),
                ),
              );
            }
          },
        ),
      );
}
