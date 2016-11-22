# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /home/android/way/tools/sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Disable the warnings of using dynamic method call in common library.
-dontnote com.android.gallery3d.common.*

# ctors of subclasses of CameraPreference are called with Java reflection.
-keep class * extends com.android.camera.CameraPreference {
  <init>(...);
}

-keep class com.android.camera.CameraActivity {
  public boolean isRecording();
  public long getAutoFocusTime();
  public long getShutterLag();
  public long getShutterToPictureDisplayedTime();
  public long getPictureDisplayedToJpegCallbackTime();
  public long getJpegCallbackFinishTime();
  public long getCaptureStartTime();
  public long getFirstPreviewTime();
}

-keep class com.android.camera.VideoModule {
  public void onCancelBgTraining(...);
  public void onProtectiveCurtainClick(...);
}

-keep class * extends android.app.Activity {
  @com.android.camera.OnClickAttr <methods>;
}

-keep class com.android.camera.CameraHolder {
  public static void injectMockCamera(...);
}

# Disable the warnings of using dynamic method calls in EffectsRecorder
-dontnote com.android.camera.EffectsRecorder

# For unit testing:

# - Required for running exif tests on userdebug
-keep class com.android.gallery3d.exif.ExifTag { *; }
-keep class com.android.gallery3d.exif.ExifData { *; }
-keep class com.android.gallery3d.exif.ExifInterface { *; }
-keepclassmembers class com.android.gallery3d.exif.Util {
  *** closeSilently(...);
}

# TODO: remove or rename android.util.Pools.java from our source.
-dontwarn android.util.Pools*
