//
//  DispatchQueue+Extension.swift
//  TMDBViewer
//
//  Created by Gabriel Targon on 24/04/23.
//

import Foundation

protocol DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void)
}

extension DispatchQueue: DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }
}

