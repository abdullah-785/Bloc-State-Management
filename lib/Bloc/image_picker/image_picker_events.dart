import 'package:equatable/equatable.dart';

class ImagePickerEvents extends Equatable {
  const ImagePickerEvents();

  List<Object> get props => [];
}

class CameraCapture extends ImagePickerEvents {}

class GalleryImagePicker extends ImagePickerEvents {}
