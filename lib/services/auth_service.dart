import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailControllerRegister = TextEditingController();
  final passwordControllerRegister = TextEditingController();

  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isErrorCredential = ValueNotifier(false);
  final ValueNotifier<bool> isErrorGeneric = ValueNotifier(false);

  User? user;

  _resetControllers() {
    passwordControllerRegister.clear();
    emailControllerRegister.clear();
    passwordController.clear();
    emailController.clear();
  }

  _setErrorGeneric(bool error) {
    isLoading.value = false;
    isErrorGeneric.value = error;
  }

  _setErrorCredential(bool error) {
    isLoading.value = false;
    isErrorCredential.value = error;
  }

  _setLoading(bool loading) {
    isLoading.value = loading;
  }

  _cleanStates() {
    _setLoading(false);
    _setErrorCredential(false);
    _setErrorGeneric(false);
  }

  Future<void> login(BuildContext context) async {
    _cleanStates();
    _setLoading(true);

    try {
      UserCredential credential =
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      user = credential.user;
      _resetControllers();
      Navigator.pushReplacementNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
      _setErrorCredential(true);
    } on Exception catch (e) {
      _setErrorGeneric(true);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register(BuildContext context) async {
    _cleanStates();
    _setLoading(true);

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailControllerRegister.text, password: passwordControllerRegister.text);
      _resetControllers();
      Navigator.pushReplacementNamed(context, "/");
    } on Exception {
      _setErrorGeneric(true);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout(BuildContext context) async {
    _cleanStates();

    try {
      await _firebaseAuth.signOut();
      user = null;
      _resetControllers();
      Navigator.pushReplacementNamed(context, "/");
    } on Exception catch (e) {
      _setErrorGeneric(true);
    } finally {
      _setLoading(false);
    }
  }
}
