//
//  NavigationViewModel.swift
//  SEACatering
//
//  Created by Muhammad Ardiansyah Asrifah on 07/06/25.
//

import Foundation
import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var selectedTab: NavigationItem = .home
}
