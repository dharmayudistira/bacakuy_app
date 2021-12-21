import 'package:bacakuy_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {

  late GoogleSignIn googleSignIn;
  var isSignedIn = false.obs;
  var isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() async {
    googleSignIn = GoogleSignIn();
    ever(isSignedIn, handleIsSignedInChanged);

    isSignedIn.value = auth.currentUser != null;

    auth.authStateChanges().listen((event) {
      isSignedIn.value = event != null;
    });

    super.onReady();
  }

  void handleIsSignedInChanged(bool isLoggedIn) {
    if(isLoggedIn) {
      //navigate to home
      Get.offNamed(Routes.MAIN);
    }else {
      return;
    }
  }

  void doLogin() async {
    isLoading.toggle();

    GoogleSignInAccount? account = await googleSignIn.signIn();

    if(account == null) {
      //user not selected any account
      isLoading.toggle();
    } else {
      GoogleSignInAuthentication authentication = await account.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );
      await auth.signInWithCredential(credential);
      isLoading.toggle();
    }
  }

  void doLogout() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    Get.offNamed(Routes.LOGIN);
  }

}
