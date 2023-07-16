import SwiftUI
import Firebase
import FirebaseCore
import FirebaseMessaging

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        
        // Obsługa powiadomień push po uruchomieniu aplikacji w wyniku powiadomienia
        if let notification = launchOptions?[.remoteNotification] as? [String: Any] {
            handlePushNotification(notification)
        }
        
        return true
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let deviceToken: [String: String] = ["token": fcmToken ?? ""]
        print("Device token: ", deviceToken) // This token can be used for testing notifications on FCM
    }
    
    private func handlePushNotification(_ userInfo: [String: Any]) {
        // Sprawdź, czy powiadomienie jest typu "News"
        if let aps = userInfo["aps"] as? [String: Any],
           let alert = aps["alert"] as? [String: Any],
           let title = alert["title"] as? String,
           let body = alert["body"] as? String,
           title == "Hello, Notification!",
           body == "This notification was pushed by RocketSim." {
            
            // Przekieruj do widoku "News"
            if let tabView = UIApplication.shared.windows.first?.rootViewController as? ContentView {
                tabView.shouldNavigateToDetail = true
                tabView.selectedIndex = 3 // Indeks tabu "News"
            }
        }
    }
}
