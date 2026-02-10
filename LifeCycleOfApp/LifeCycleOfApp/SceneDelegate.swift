import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("\(type(of: self)): willConnectTo")
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("\(type(of: self)): sceneDidDisconnect")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("\(type(of: self)): sceneDidBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("\(type(of: self)): sceneWillResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("\(type(of: self)): sceneWillEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("\(type(of: self)): sceneDidEnterBackground")
    }


}

