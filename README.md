
I- Guide to install the project

II- The tools/ packages i used
    1- App structure: The way i organised my project
    2- Getx: A stateManagment package
    3- NativeSPlashScreen: A package for replacing the initial white screen
    4- xaml files: Changing the app icon
    5- changing the application name
    6- FireBase: online data base
    7- GetStorage: Local storage
III- My notes


I- Guide to install the project
Once you install the code from GitHub "https://github.com/YesserBs/e-commerce"
Open it with your TextEditor (VS code or Android Studio)
then assuming you have Flutter and Dart Plugins installed and configured you should 
get all of the dependencies in the pubspec.yaml file. (you can type "flutter doctor"
in terminal to check if there are any issues with your Flutter setup)
So you have to tap the following comand in the project terminal:
"flutter pub get"
And now when you type the following command:
"flutter run"
the app should run.
Of course the data will not be fetched from my database, normally you will have a
fetching error but that won't stop the app from running.
you can always create your own online database using firebase check II)5-FireBase
in this file for guidance

II- The tools/ packages i used
    1- App structure: The way i organised my project
This is how i organised my lib directory: 
a) "config" this file is made for all the configurations: which means for
all the static predefined widgets that i will be using, for instance the
colors, the fontSizes, the fontFamilies... 
b) "custom" fis for all the Widgets that i will be using 
repeatedly in the code, for example a button with a certain config 
color and a certain font size, texts, and other complex widgets such 
as the ToggleButton... 
c) "main_settings"
    c1) "appPages" in this page i have defined all of the Getpages,
        and GetPages are pages that are named, that point to a class
        and to a specefic binding (i only used one binding though)
    c2) "binding" this page is responsible for calling the Getx controllers
        whenever needed with LazyPut
d) "objects" This page contains the classes that will be used in 
the code as objects fr example the user or the article, and all the data
is brought from the database
e) "services" it is optional at this level, i put in it a static firebase
file and getStorage file
f) "view" Contains all of the views = pages = designs) and their coresponding 
GetX controllers, infact each page in the app has a directory where we can
find a design, and a seperate controller for all the logic of the page
for example:
directory: home / design: HomePage / logic: HomeController
g) "main" in this file i simply made calls especially to the dashboard
which is a page that wraps all the other pages:
This page is the only one that is always displayed, and with the IndexedStack
widget it is possible to show other pages within the dashboard page.

    2- Getx
A popular UI framework and a powerful tool to manage app state, navigation, 
and dependency injection, simplifying the development process as i 
explained earlier.

    3- NativeSPlashScreen
You can check: https://pub.dev/packages/flutter_native_splash
Or follow a video: https://www.youtube.com/watch?v=dB0dOnc2k10
And here is a guide:
First, add flutter_native_splash as a dependency in your pubspec.yaml file.
"
dependencies:
  flutter_native_splash: ^2.3.1"
Don't forget to "flutter pub get".
Customize the following settings and add to your project's pubspec.yaml file or place 
in a new file in your root project folder named flutter_native_splash.yaml.

(ends with '*/')
/*
flutter_native_splash:
# This package generates native code to customize Flutter's default white native splash screen
# with background color and splash image.
# Customize the parameters below, and run the following command in the terminal:
# dart run flutter_native_splash:create
# To restore Flutter's default white splash screen, run the following command in the terminal:
# dart run flutter_native_splash:remove

# color or background_image is the only required parameter.  Use color to set the background
# of your splash screen to a solid color.  Use background_image to set the background of your
# splash screen to a png image.  This is useful for gradients. The image will be stretch to the
# size of the app. Only one parameter can be used, color and background_image cannot both be set.
color: "#42a5f5"
#background_image: "assets/background.png"

# Optional parameters are listed below.  To enable a parameter, uncomment the line by removing
# the leading # character.

# The image parameter allows you to specify an image used in the splash screen.  It must be a
# png file and should be sized for 4x pixel density.
#image: assets/splash.png

# The branding property allows you to specify an image used as branding in the splash screen.
# It must be a png file. It is supported for Android, iOS and the Web.  For Android 12,
# see the Android 12 section below.
#branding: assets/dart.png

# To position the branding image at the bottom of the screen you can use bottom, bottomRight,
# and bottomLeft. The default values is bottom if not specified or specified something else.
#branding_mode: bottom

# The color_dark, background_image_dark, image_dark, branding_dark are parameters that set the background
# and image when the device is in dark mode. If they are not specified, the app will use the
# parameters from above. If the image_dark parameter is specified, color_dark or
# background_image_dark must be specified.  color_dark and background_image_dark cannot both be
# set.
#color_dark: "#042a49"
#background_image_dark: "assets/dark-background.png"
#image_dark: assets/splash-invert.png
#branding_dark: assets/dart_dark.png

# Android 12 handles the splash screen differently than previous versions.  Please visit
# https://developer.android.com/guide/topics/ui/splash-screen
# Following are Android 12 specific parameter.
android_12:
# The image parameter sets the splash screen icon image.  If this parameter is not specified,
# the app's launcher icon will be used instead.
# Please note that the splash screen will be clipped to a circle on the center of the screen.
# App icon with an icon background: This should be 960×960 pixels, and fit within a circle
# 640 pixels in diameter.
# App icon without an icon background: This should be 1152×1152 pixels, and fit within a circle
# 768 pixels in diameter.
#image: assets/android12splash.png

    # Splash screen background color.
    #color: "#42a5f5"

    # App icon background color.
    #icon_background_color: "#111111"

    # The branding property allows you to specify an image used as branding in the splash screen.
    #branding: assets/dart.png

    # The image_dark, color_dark, icon_background_color_dark, and branding_dark set values that
    # apply when the device is in dark mode. If they are not specified, the app will use the
    # parameters from above.
    #image_dark: assets/android12splash-invert.png
    #color_dark: "#042a49"
    #icon_background_color_dark: "#eeeeee"

# The android, ios and web parameters can be used to disable generating a splash screen on a given
# platform.
#android: false
#ios: false
#web: false

# Platform specific images can be specified with the following parameters, which will override
# the respective parameter.  You may specify all, selected, or none of these parameters:
#color_android: "#42a5f5"
#color_dark_android: "#042a49"
#color_ios: "#42a5f5"
#color_dark_ios: "#042a49"
#color_web: "#42a5f5"
#color_dark_web: "#042a49"
#image_android: assets/splash-android.png
#image_dark_android: assets/splash-invert-android.png
#image_ios: assets/splash-ios.png
#image_dark_ios: assets/splash-invert-ios.png
#image_web: assets/splash-web.gif
#image_dark_web: assets/splash-invert-web.gif
#background_image_android: "assets/background-android.png"
#background_image_dark_android: "assets/dark-background-android.png"
#background_image_ios: "assets/background-ios.png"
#background_image_dark_ios: "assets/dark-background-ios.png"
#background_image_web: "assets/background-web.png"
#background_image_dark_web: "assets/dark-background-web.png"
#branding_android: assets/brand-android.png
#branding_dark_android: assets/dart_dark-android.png
#branding_ios: assets/brand-ios.gif
#branding_dark_ios: assets/dart_dark-ios.gif

# The position of the splash image can be set with android_gravity, ios_content_mode, and
# web_image_mode parameters.  All default to center.
#
# android_gravity can be one of the following Android Gravity (see
# https://developer.android.com/reference/android/view/Gravity): bottom, center,
# center_horizontal, center_vertical, clip_horizontal, clip_vertical, end, fill, fill_horizontal,
# fill_vertical, left, right, start, or top.
#android_gravity: center
#
# ios_content_mode can be one of the following iOS UIView.ContentMode (see
# https://developer.apple.com/documentation/uikit/uiview/contentmode): scaleToFill,
# scaleAspectFit, scaleAspectFill, center, top, bottom, left, right, topLeft, topRight,
# bottomLeft, or bottomRight.
#ios_content_mode: center
#
# web_image_mode can be one of the following modes: center, contain, stretch, and cover.
#web_image_mode: center

# The screen orientation can be set in Android with the android_screen_orientation parameter.
# Valid parameters can be found here:
# https://developer.android.com/guide/topics/manifest/activity-element#screen
#android_screen_orientation: sensorLandscape

# To hide the notification bar, use the fullscreen parameter.  Has no effect in web since web
# has no notification bar.  Defaults to false.
# NOTE: Unlike Android, iOS will not automatically show the notification bar when the app loads.
#       To show the notification bar, add the following code to your Flutter app:
#       WidgetsFlutterBinding.ensureInitialized();
#       SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top], );
#fullscreen: true

# If you have changed the name(s) of your info.plist file(s), you can specify the filename(s)
# with the info_plist_files parameter.  Remove only the # characters in the three lines below,
# do not remove any spaces:
#info_plist_files:
#  - 'ios/Runner/Info-Debug.plist'
#  - 'ios/Runner/Info-Release.plist'
*/

Custumize the file with the image you want to show and the color and finally
run these two commands:
"dart run flutter_native_splash:create"
"dart run flutter_native_splash:create --path=path/to/my/file.yaml"

    4- xaml files:
First, you obviously need an image, then you generate mipmap files from that image using this 
website https://www.appicon.co/ (App icon generator)
It will generate a folder of mipmap image, you will paste them in this location:
TheProjectName\android\app\src\main\res
and that should work

    5- Changing the application name
Get to AndroidManifest (TheProjectName\android\app\src\main) then to AndroidManifest.xml
then in the application tag in android:name enter your app name

    6- FireBase
FireBase SetUp:

1) Creation d'un compte/ Connexion sur le site de FireBAse
2) Creation d'un projet (Saisir un nom de projet)
3) Ajouter FB a mon application Flutter -> il faut installer CLI Firebase
4) Pour installer CLI FB ( Réferance:

"https://firebase.google.com/docs/cli?hl=fr&authuser=0&_gl=1*tc30jp*_ga*MjEyMDgxNDM1Mi4xNjg4NDc3MTc3*_ga_CW55HF8NVT*MTY4ODcxNjkxNC40LjEuMTY4ODcxODI2My4wLjAuMA..#windows-npm")

On installe Node.js qui va automatiquement installer quelques outils
5) On execute la commande suivante "npm install -g firebase-tools" dans un terminal
6) Une fois CLI installé, on passe a l'etape suivante 'Installer et exécuter la CLI FlutterFire' executer cette commande depuis nimporte quel repertoire par example dans le terminal du projet dans android studio "dart pub global activate flutterfire_cli"
   On nous demande d'ajouter flutterfire au PATH, on copie le chemin d'access donné dans la console 'C:\Users\Yesser\AppData\Local\Pub\Cache\bin' puis on ouvre Changer les variables ... (Il y a des chances qu'on ne puisse pas modifier les variables systeme par précaution et sécurité, pour les changer on ouvre panneau de configuration puis systeme et sécurité -> systeme -> parametres avancées du systeme) Path -> Modifier -> coller le chemin ... OK

On execute 'firebase login' mais
on pourait rencontrer un autre probleme:

"firebase : Impossible de charger le fichier C:\Users\Yesser\AppData\Roaming\npm\firebase.ps1, car l’exécution de scripts est désactivée sur ce système. Pour
plus d’informations, consultez about_Execution_Policies à l’adresse https://go.microsoft.com/fwlink/?LinkID=135170.
Au caractère Ligne:1 : 1
+ firebase login
+ ~~~~~~~~
    + CategoryInfo          : Erreur de sécurité : (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess"

L'erreur indique que l'exécution de scripts PowerShell est désactivée sur le système, ce qui empêche le chargement du script nécessaire pour exécuter la commande firebase login.
Pour résoudre ce problème, On peut modifier la politique d'exécution de PowerShell pour autoriser l'exécution de scripts
1) On ouvre une fentre powershell en tant que administrateur
2) On peut voir la politique déja en tapent la commande "Get-ExecutionPolicy"
   Restricted: restreinte et pas possible d'executer les scripts
   RemoteSigned: On peut executer les scripts
   Maintenant pour changer l'etat:
   "Set-ExecutionPolicy RemoteSigned" comme son nom l'indique change en RemoteSigned
   "Set-ExecutionPolicy Restricted" Sets restricted
   Cbon.

III) Maintenant 3eme commande a executer:
'flutterfire configure --project=myflutproject'
Toujours 'y' pour yes, enfin on nous donne les ids et c bon.

    7- GetStorage: Local storage

It's a local storage package, offering a simple way to store key-value data
permanently on the device.
Here's how you can use it:
Pour activer storage:
Tout d'abbord dans le terminal:
flutter pub add firebase_storage

dans android [...] / app / src / build.gradle on chnage minSDKversion ...
en minSdkVersion 19 puis on ajoute une ligne multiDexEnabled true

Recap:
Dans build.gradle:
        minSdkVersion 19
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        multiDexEnabled true
Dans pubspec.yaml:
dependencies:
flutter:
sdk: flutter
get: ^4.1.4
flutter_svg: ^0.22.0
font_awesome_flutter: ^10.4.0
get_storage: ^2.0.3


III- My notes:
You can find all of my notes and the development process with all the details,
and a step by step guide in this GitHub repository containing over 150 commits:
https://github.com/YesserBs/LearningFlut



