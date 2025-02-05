//
//  UIApplicationExtension.swift
//  TheParkBand
//
//  Created by Jim Lambert on 2/5/25.
//

import UIKit

extension UIApplication {
  func rootViewController() -> UIViewController? {
    var rootViewController: UIViewController? = nil
    if #available(iOS 13, *) {
      for scene in connectedScenes {
        if let windowScene = scene as? UIWindowScene {
          for window in windowScene.windows {
            if window.isKeyWindow { rootViewController = window.rootViewController }
          }
        }
      }
    } else {
      rootViewController = keyWindow?.rootViewController
    }
    while true {
      if let presented = rootViewController?.presentedViewController {
        rootViewController = presented
      } else if let navController = rootViewController as? UINavigationController {
        rootViewController = navController.topViewController
      } else if let tabBarController = rootViewController as? UITabBarController {
        rootViewController = tabBarController.selectedViewController
      } else {
        break
      }
    }
    return rootViewController
  }
}
