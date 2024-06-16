import 'dart:io';

import 'package:bloc_app/Bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_app/Bloc/image_picker/image_picker_events.dart';
import 'package:bloc_app/Bloc/image_picker/image_picker_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                builder: (context, state) {
              if (state.file == null) {
                return Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.read<ImagePickerBloc>().add(CameraCapture());
                        },
                        child: Center(child: Icon(Icons.camera, size: 30))),
                  ],
                );
              } else {
                return Center(
                    child: Image.file(File(state.file!.path.toString())));
              }
            }),
            BlocBuilder<ImagePickerBloc, ImagePickerStates>(
                builder: (context, state) {
              if (state.galleryFile == null) {
                return GestureDetector(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(GalleryImagePicker());
                    },
                    child: Center(
                        child: Icon(
                      Icons.photo,
                      size: 30,
                    )));
              } else {
                return Center(
                    child:
                        Image.file(File(state.galleryFile!.path.toString())));
              }
            })
          ],
        ),
      ),
    );
  }
}
