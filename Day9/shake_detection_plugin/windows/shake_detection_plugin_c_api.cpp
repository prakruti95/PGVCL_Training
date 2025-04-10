#include "include/shake_detection_plugin/shake_detection_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "shake_detection_plugin.h"

void ShakeDetectionPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  shake_detection_plugin::ShakeDetectionPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
