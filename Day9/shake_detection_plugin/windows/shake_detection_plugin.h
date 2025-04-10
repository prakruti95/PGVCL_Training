#ifndef FLUTTER_PLUGIN_SHAKE_DETECTION_PLUGIN_H_
#define FLUTTER_PLUGIN_SHAKE_DETECTION_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace shake_detection_plugin {

class ShakeDetectionPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ShakeDetectionPlugin();

  virtual ~ShakeDetectionPlugin();

  // Disallow copy and assign.
  ShakeDetectionPlugin(const ShakeDetectionPlugin&) = delete;
  ShakeDetectionPlugin& operator=(const ShakeDetectionPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace shake_detection_plugin

#endif  // FLUTTER_PLUGIN_SHAKE_DETECTION_PLUGIN_H_
