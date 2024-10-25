import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_auth_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_format_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/core/utlis/local_storage/t_local_storage.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/auth/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/features/auth/verify_email/presentation/views/verify_email_view.dart';
import 'package:t_store/features/on_boarding/presentation/views/language_view.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variable
  final deviceStorage =GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;

  // Called From main.dart on app launch
  @override
  void onReady() async{
    await screenRedirect();
    FlutterNativeSplash.remove();
    super.onReady();
  }

  ThemeMode initTheme() {
    deviceStorage.writeIfNull("isDarkTheme", false);
    if(deviceStorage.read("isDarkTheme")){
      return ThemeMode.dark;
    }
    else{
      return ThemeMode.light;
    }
  }

  Locale? initLanguage() {
    if(deviceStorage.read("lang") != null)
    {
      Locale localeLang = Locale(deviceStorage.read("lang"));
      return localeLang;
    }
    else {
      return null;
    }
  }


  // Function to Show Relevant Screen
 Future<void> screenRedirect() async{
    final User? user = _auth.currentUser;
    if(user !=null)
      {
        if(user.emailVerified)
          {
            await TLocalStorage.init(user.uid);
            Get.offAll(() => const NavigationMenuView());
          }
        else{
          Get.offAll(()=> VerifyEmailView(email: _auth.currentUser?.email));
        }
      }
    else{
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") !=true ? Get.offAll(()=> const LogInView()) : Get.offAll(() => const LanguageView());
    }
  }

  // EmailAuthentication - Login
  Future<UserCredential> loginWithEmailAndPassword(String email,String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch (e)
    {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_){
      throw const TFormatException();
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }
  }


  // EmailAuthentication - Register
  Future<UserCredential> registerWithEmailAndPassword(String email,String password) async {
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch (e)
    {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_){
      throw const TFormatException();
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }
  }

  // Mail Verification
  Future<void> sendEmailVerification() async
  {
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e)
    {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_){
      throw const TFormatException();
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }
  }

  // Forget Password
  Future<void> sendPasswordResetEmail({required String email}) async
  {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e)
    {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_){
      throw const TFormatException();
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }
  }

  // Login using Google
  Future<UserCredential> signInWithGoogle() async
  {
    try{
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      final  credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    }
    on FirebaseAuthException catch (e)
    {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_){
      throw const TFormatException();
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }
  }

  // LogOut User
  Future<void> logout() async
  {
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LogInView());
    }on FirebaseAuthException catch (e)
    {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_){
      throw const TFormatException();
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }

  }

  Future<void> reAuthenticateWithEmailAndPassword(String email,String password) async{
    try{
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    }
    on FirebaseAuthException catch (e)
    {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_){
      throw const TFormatException();
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }

  }
  
  Future<void> deleteAccount() async{
    try{
      await UserRepository.instance.deleteAccount(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    }
    on FirebaseAuthException catch (e)
    {
      throw TFirebaseAuthException(e.code).message;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on FormatException catch (_){
      throw const TFormatException();
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }
  }
}