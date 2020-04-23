import 'package:flutter/material.dart';
import 'package:homathon_project/src/providers/edit_profile_provider.dart';
import 'package:homathon_project/src/ui/shared/app_colors.dart';
import 'package:homathon_project/src/ui/shared/ui_helpers.dart';
import 'package:homathon_project/src/ui/widgets/rounded_button.dart';
import 'package:homathon_project/src/ui/widgets/user_circle.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider_architecture/provider_architecture.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => EditProfileProvider(),
      builder: (
        BuildContext context,
        EditProfileProvider provider,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Edit Your Profile',
              style: TextStyle(
                color: textColorWhite,
                fontSize: blockSizeHorizontal(context) * 8,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            await provider.pickImage(
                              source: ImageSource.gallery,
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              UserCircle(
                                height: blockSizeHorizontal(context) * 40,
                                width: blockSizeHorizontal(context) * 40,
                                image: provider.displayProfileImage(),
                              ),
                              Opacity(
                                opacity: 0.4,
                                child: Container(
                                  height: blockSizeHorizontal(context) * 40,
                                  width: blockSizeHorizontal(context) * 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: textColorBlack,
                                  ),
                                ),
                              ),
                              Text(
                                'Change Profile\nPicture',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textColorWhite,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 7,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                initialValue: provider.currentUser.firstName,
                                onSaved: (value) {
                                  provider.newFirstName = value;
                                },
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(
                                    fontSize: blockSizeHorizontal(context) * 4,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: primaryColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: blockSizeHorizontal(context) * 5,
                            ),
                            Expanded(
                              child: TextFormField(
                                initialValue: provider.currentUser.lastName,
                                onSaved: (value) {
                                  provider.newLastName = value;
                                },
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(
                                    fontSize: blockSizeHorizontal(context) * 4,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: primaryColor,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth(context) * 0.05,
                        ),
                        TextFormField(
                          initialValue: provider.currentUser.email,
                          onSaved: (value) {
                            provider.newEmail = value;
                          },
                          style: TextStyle(
                            color: primaryColor,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 4,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: primaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                screenWidth(context),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth(context) * 0.1,
                        ),
                        RoundedButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: blockSizeHorizontal(context) * 8,
                            vertical: blockSizeHorizontal(context) * 5,
                          ),
                          isBusy: provider.busy,
                          text: 'Save Profile',
                          fontSize: blockSizeHorizontal(context) * 6,
                          onPressed: () async {
                            await provider.submit();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
