import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  ImagePicker _picker = ImagePicker();

  Future<XFile?> CameraCaptureUtils() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> GalleryImagePickerUtils() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
