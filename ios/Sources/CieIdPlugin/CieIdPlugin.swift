import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CieIdPlugin)
public class CieIdPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "CieIdPlugin"
    public let jsName = "CieId"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = CieId()
    private var callbackId: String?

    @objc func authenticate(_ call: CAPPluginCall) {
        self.callbackId = call.callbackId
        let value = call.getString("serviceProviderUrl") ?? ""
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: value)!, options: [:], completionHandler: { success in
                if success {
                    print("yeah")
                } else {
                    print("Failed to open Service Provider URL")
                }
                
            })
        }
    }
    
    public override func load() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleOpenUrl(_:)),
                                               name: NSNotification.Name("AppDidOpenUrl"), object: nil)
    }
    
    @objc func handleOpenUrl(_ notification: Notification) {
        // Stampa il contenuto della notifica a console
        print("Received notification:", notification)

        // Recupera i dati dalla notifica
        guard let object = notification.object as? [String: Any],
              let url = object["url"] as? URL else {
            print("Notification does not contain valid URL")
            return
        }

        // Converte l'URL e i parametri in una stringa
        let notificationContent = url.absoluteString
        print("Notification content as string:", notificationContent)

        // Risolve il callback passando la stringa
        if let callbackId = self.callbackId, let savedCall = bridge?.savedCall(withID: callbackId) {
            savedCall.resolve([
                "status": "success",
                "URL": notificationContent
            ])
        } else {
            print("No callback ID or saved call available to resolve")
        }
    }

}
