
import 'package:flutter/material.dart';
import 'package:flutter_twitter/model/user_model.dart';
import 'package:flutter_twitter/theme/colors.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;

  const EditProfileScreen({
    Key? key,
    required this.user
  }): super (key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late String _name;
  late String _bio;
  var _profileImage;
  var _coverImage;
  late String _imagePickedType;
  final _formKey = GlobalKey <FormState>();
  final bool _isLoading = false;

  displayCoverImage() {
    if(_coverImage == null ) {
      if(widget.user.coverImage.isEmpty) {
        return NetworkImage(widget.user.profilePicture);
      }
    } else {
      return FileImage(_coverImage);
    }
  }

  displayProfileImage() {
    if(_profileImage == null ) {
      if(widget.user.profilePicture.isEmpty) {
        return const AssetImage('assets/logo.png');
      } else {
        return NetworkImage(widget.user.profilePicture);
      }
    } else {
      return FileImage(_profileImage);
    }
  }

  saveProfile() {

  }

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _bio = widget.user.bio;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: kTweeterColor,
                  image: _coverImage == null && widget.user.coverImage.isEmpty
                  ? null
                  : DecorationImage(
                        fit: BoxFit.fill,
                        image: displayCoverImage()
                      )
                ),
              ),
              Container(
                height: 150,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.camera_alt,
                      size: 70,
                      color: Colors.white,
                    ),
                    Text(
                      'Change Cover Photo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            transform: Matrix4.translationValues(0, -45, 0),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: displayProfileImage()
                            ),
                            CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,  
                                children: const [
                                  Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Change Profile Photo',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: saveProfile,
                          child: Container(
                            width: 100,
                            height: 35,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: kTweeterColor,
                            ),
                            child: const Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      TextFormField(
                        initialValue: _name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: kTweeterColor
                          ),
                        ),
                        validator: (input) => input!.trim().length < 2 
                        ? 'please enter valid name'
                        : null,
                        onSaved: (value) {
                          _name = value!;
                        },
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        initialValue: _bio,
                        decoration: const InputDecoration(
                          labelText: 'Bio',
                          labelStyle: TextStyle(
                            color: kTweeterColor
                          ),
                        ),
                        validator: (input) => input!.trim().length < 2 
                        ? 'please enter valid name'
                        : null,
                        onSaved: (value) {
                          _bio = value!;
                        },
                      ),
                      const SizedBox(height: 30,),
                      _isLoading 
                      ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(kTweeterColor),
                      )
                      : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}