//
//  AppDelegate.swift
//  profsoft-SwiftUI
//
//  Created by Кирилл Колесников on 18.08.2021.
//

import Foundation
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

		registerDependencies()

		return true
	}
}


private extension AppDelegate {

	func registerDependencies() {
		Dependencies {
			Dependency { GeneralService() }
		}
		.build()
	}
}
