import 'package:bloc_app/Bloc/image_picker/image_picker_events.dart';
import 'package:bloc_app/Bloc/image_picker/image_picker_states.dart';
import 'package:bloc_app/Utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerStates()) {
    on<CameraCapture>(cameraCaptureFun);
    on<GalleryImagePicker>(galleryPickerFun);
  }

  void cameraCaptureFun(
      CameraCapture events, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.CameraCaptureUtils();
    emit(state.copyWith(file: file));
  }

  void galleryPickerFun(
      GalleryImagePicker events, Emitter<ImagePickerStates> emit) async {
    final XFile? galleryFile = await imagePickerUtils.GalleryImagePickerUtils();
    emit(state.copyWith(galleryFile: galleryFile));
  }
}
