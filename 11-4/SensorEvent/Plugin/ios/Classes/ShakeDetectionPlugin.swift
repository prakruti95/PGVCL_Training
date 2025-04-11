import Flutter
import UIKit
import CoreMotion

public class ShakeDetectionPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private let motionManager = CMMotionManager()
  private var eventSink: FlutterEventSink?
  private var lastShakeDate = Date(timeIntervalSince1970: 0)
  private var shakeCount = 0
  private var canShake = true

  public static func register(with registrar: FlutterPluginRegistrar) {
    let eventChannel = FlutterEventChannel(name: "shake_detection_plugin/shake_event", binaryMessenger: registrar.messenger())
    let instance = ShakeDetectionPlugin()
    eventChannel.setStreamHandler(instance)
  }

  public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = events
    startAccelerometer()
    return nil
  }

  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    stopAccelerometer()
    self.eventSink = nil
    return nil
  }

  private func startAccelerometer() {
    if motionManager.isAccelerometerAvailable {
      motionManager.accelerometerUpdateInterval = 0.1 // 100ms
      motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { [weak self] data, error in
        guard let self = self, let data = data else { return }

        let x = data.acceleration.x
        let y = data.acceleration.y
        let z = data.acceleration.z

        let acceleration = sqrt(x * x + y * y + z * z)

        let SHAKE_THRESHOLD = 2.5 // You may need to tune this value

        if acceleration > SHAKE_THRESHOLD && self.canShake {
          self.shakeCount += 1

          if self.shakeCount == 2 {
            self.eventSink?(nil)
            self.shakeCount = 0
            self.canShake = false

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
              self.canShake = true
            }
          }
        }
      }
    }
  }

  private func stopAccelerometer() {
    if motionManager.isAccelerometerActive {
      motionManager.stopAccelerometerUpdates()
    }
  }
}
