import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../HomePage/Home_nav.dart';
import 'LoginScreen.dart';
import 'ReusableWidgets.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({ super.key});
  // final CameraDescription camera;
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final FullNameController = TextEditingController();
  final EmailController = TextEditingController();
  final PassWordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
   File? _image;
  Future getImage(bool isCamera) async {
    try {
      ImageSource source = isCamera ? ImageSource.camera : ImageSource.gallery;
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {});
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }


  // late String? imagePath; // Declared at the class level
  //
  // // declaring the camera controller
  // // late CameraController _cameraController;
  // // late Future<void> initializeCameraControllerFuture;
  //
  // // @override
  // // void initState() {
  // //   super.initState();
  // //   _cameraController = CameraController(
  // //     widget.camera,
  // //     ResolutionPreset.medium,
  // //   );
  // //   initializeCameraControllerFuture = _cameraController.initialize();
  // // }
  //
  // // @override
  // // void dispose() {
  // //   _cameraController.dispose();
  // //   super.dispose();
  // // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // FutureBuilder(
              //   future: initializeCameraControllerFuture,
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       return AspectRatio(
              //         aspectRatio: _cameraController.value.aspectRatio,
              //         child: CameraPreview(_cameraController),
              //       );
              //     } else {
              //       return const Center(
              //         child: CircularProgressIndicator(
              //           color: Colors.blue,
              //         ),
              //       );
              //     }
              //   },
              // ),
              ShowLinkedInImage(),
              BigText("LINKEDIN", FontWeight.bold, Colors.blue),
              showHeight(),
              BigText("Create   Account", FontWeight.bold, Colors.black),
              showHeight(),
              textFormField(
                FullNameController,
                TextInputType.text,
                const Icon(Icons.person),
                null,
                false,
                "Enter FullName",
                "FullName",
              ),
              showHeight(),
              textFormField(
                EmailController,
                TextInputType.emailAddress,
                const Icon(Icons.email),
                null,
                false,
                "Enter Email",
                "Email",
              ),
              showHeight(),
              textFormField(
                PassWordController,
                TextInputType.visiblePassword,
                const Icon(Icons.key),
                const Icon(Icons.visibility_off),
                true,
                "Enter Password",
                "Password",
              ),
              showHeight(),
              textFormField(
                confirmPasswordController,
                TextInputType.visiblePassword,
                const Icon(Icons.key),
                const Icon(Icons.visibility_off),
                true,
                "please confirm password",
                "Confirm password",
              ),
              showHeight(),
              const Text("Click to Upload Your Photo"),
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        getImage(true);
                      }, icon: const Icon(Icons.camera_alt,size: 30,)),
                  const SizedBox(width: 50,),
                  IconButton(
                      onPressed: (){
                        getImage(false);
                      }, icon: const Icon(Icons.insert_drive_file,size: 30,)),
                ],
              ),
               _image == null ? Container() : CircleAvatar(radius: 50,child: Image.file(_image!,fit: BoxFit.fill,),),
              // IconButton(
              //   onPressed: () async {
              //     try {
              //       await initializeCameraControllerFuture;
              //       final image = await _cameraController.takePicture();
              //       if (!mounted) {
              //         return;
              //       }
              //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplayPictureScreen(imagePath: image.path)));
              //     } catch (e) {
              //       print(e);
              //     }
              //   },
              //   icon: const Icon(Icons.camera, size: 40),
              // ),
              showHeight(),
              showHeight(),
              ShowButton(
                Colors.blue,
                    () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeNavigation(),
                    ),
                  );
                },
                "Sign Up",
                BorderSide.none,
                FontWeight.bold,
              ),
              showHeight(),
              Row(
                children: [
                  SmallText("Already Have An Account?", Colors.black87),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: SmallText("Log In", Colors.blue),
                  ),
                ],
              ),
              showHeight(),
              showHeight(),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.3),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BigText("OR", FontWeight.normal, Colors.black87),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.3),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              showHeight(),
              ShowElevatedButton(
                Colors.white,
                    () {},
                "Sign Up With Google",
                const BorderSide(color: Colors.blue),
                FontWeight.normal,
                "images/google.png",
              ),
              showHeight(),
              ShowElevatedButton(
                Colors.white,
                    () {},
                "Sign Up With Apple",
                const BorderSide(color: Colors.blue),
                FontWeight.normal,
                "images/apple.png",
              ),
              showHeight(),
              ShowElevatedButton(
                Colors.white,
                    () {},
                "Sign Up With Facebook",
                const BorderSide(color: Colors.blue),
                FontWeight.normal,
                "images/facebook.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;
//
//   const DisplayPictureScreen({super.key, required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.file(File(imagePath)),
//           ],
//         ),
//       )
//     );
//   }
// }