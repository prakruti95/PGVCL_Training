//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <shake_detection_plugin/shake_detection_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) shake_detection_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ShakeDetectionPlugin");
  shake_detection_plugin_register_with_registrar(shake_detection_plugin_registrar);
}
