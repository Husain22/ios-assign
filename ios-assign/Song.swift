//
//  Song.swift
//  ios-assign
//
//  Created by Husain Alkuwaiti on 06/10/2023.
//

import Foundation

struct Song: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: String
}

