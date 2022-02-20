import 'package:codigo_form/utils/auth_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../bloc/auth_cubit/auth_cubit.dart';
import '../../common/constants/colors.dart';
import '../../common/enums/gender.dart';
import '../../common/interfaces/cubit_form_state_interface.dart';
import '../../components/_components.dart';
import 'widgets/_widgets.dart';

class RegisterPage extends HookWidget with AuthValidator {
  const RegisterPage({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  static final _formKey = GlobalKey<FormState>();

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final dateinput = useTextEditingController();

    useEffect(() {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }, []);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    FormAppbar(width: width),
                    CubitFormBuilder<AuthCubit, AuthState>(
                      cubit: AuthCubit(),
                      formKey: _formKey,
                      onSuccess: (state) {
                        assert(state.user != null, 'User should response');
                        print("User Registered ${state.user.toString()}");
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return UserDialog(user: state.user!);
                          },
                        );
                      },
                      builder: (cubit, state) {
                        Future<void> _handleRegister() async {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            await cubit.createAccount();
                          }
                        }

                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                labelText: "First Name *",
                                onChanged: (e) =>
                                    cubit.updateData({"firstName": e}),
                                validator: firstNameValidator,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                labelText: "Last Name *",
                                onChanged: (e) =>
                                    cubit.updateData({"lastName": e}),
                                validator: lastNameValidator,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                labelText: "Email Address *",
                                onChanged: (e) =>
                                    cubit.updateData({"email": e}),
                                validator: emailValidator,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 62,
                                      child: CustomTextFormField(
                                        controller: dateinput,
                                        labelText: "Date of Birth *",
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(
                                                      2000), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2101));

                                          if (pickedDate != null) {
                                            print(pickedDate);
                                            String formattedDate =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(pickedDate);
                                            print(formattedDate);
                                            dateinput.text = formattedDate;
                                            cubit.updateData(
                                                {"dob": formattedDate});
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                        suffixIcon: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Image.asset(
                                              "assets/images/dob/dob@3x.png",
                                              height: 32,
                                              width: 32,
                                            ),
                                          ),
                                        ),
                                        validator: dobValidator,
                                        readOnly: true,
                                        keyboardType: TextInputType.datetime,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  GenderSwitch(
                                    gender:
                                        state.data['gender'] ?? Gender.female,
                                    onChanged: (int? value) {
                                      cubit.updateData({
                                        "gender": value == 1
                                            ? Gender.male
                                            : Gender.female
                                      });
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                labelText: "Nationality *",
                                onChanged: (e) =>
                                    cubit.updateData({"nationality": e}),
                                validator: nationalityValidator,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                labelText: "Country of Residence *",
                                onChanged: (e) => cubit.updateData({"cor": e}),
                                validator: corValidator,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: CustomTextFormField(
                                      labelText: "Code",
                                      onChanged: (e) =>
                                          cubit.updateData({"countryCode": e}),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  Expanded(
                                    child: CustomTextFormField(
                                      labelText: "Mobile no. (Optional)",
                                      onChanged: (e) =>
                                          cubit.updateData({"phNo": e}),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              if (state.status == FormStatus.error &&
                                  state.errorMessage.isNotEmpty)
                                Text(
                                  state.errorMessage,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 8,
                                ),
                                child: MainButton(
                                  onPressed: _handleRegister,
                                  text: "Create my account now",
                                  gradientColor: gradientColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SittingGuitar(width: width),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
