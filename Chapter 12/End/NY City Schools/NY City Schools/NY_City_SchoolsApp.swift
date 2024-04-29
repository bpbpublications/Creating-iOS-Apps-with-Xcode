//
//  NY_City_SchoolsApp.swift
//  NY City Schools
//
//  Created by Aaron L Bratcher on 9/17/23.
//

import SwiftUI

@main
struct NY_City_SchoolsApp: App {
    var body: some Scene {
        WindowGroup {
			  SchoolList()
        }
    }
}

extension UIApplication {
	public static var isRunningTest: Bool {
		@AppStorage("testMode") var runningTest: Bool = false

		return runningTest || ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
	 }
}
