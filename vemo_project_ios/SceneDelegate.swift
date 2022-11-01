//
//  SceneDelegate.swift
//  vemo_project_ios
//
//  Created by Акжан Калиматов on 19.10.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        
                // Settings to Onboarding and Login views
                // For example to skip after launching or if user loggen in

               let launchedBefore = UserDefaults.standard.bool(forKey: "hasLaunched")
               let launchStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
               let currentUser = Auth.auth().currentUser?.uid
               var vc: UIViewController
               if launchedBefore
               {
                   if(currentUser == nil) {
                       vc = mainStoryboard.instantiateInitialViewController()!
                   } else {
                       vc = mainStoryboard.instantiateViewController(identifier: "SearchVC")
                   }
                   
               }
               else
               {
                   vc = launchStoryboard.instantiateViewController(identifier: "OnboardingVC")
               }
               UserDefaults.standard.set(true, forKey: "hasLaunched")
               self.window?.rootViewController = vc
        }
        
                
           
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }




