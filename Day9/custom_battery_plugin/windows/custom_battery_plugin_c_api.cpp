#include "include/custom_battery_plugin/custom_battery_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "custom_battery_plugin.h"

void CustomBatteryPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  custom_battery_plugin::CustomBatteryPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
