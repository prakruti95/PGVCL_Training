//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <custom_battery_plugin/custom_battery_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) custom_battery_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "CustomBatteryPlugin");
  custom_battery_plugin_register_with_registrar(custom_battery_plugin_registrar);
}
