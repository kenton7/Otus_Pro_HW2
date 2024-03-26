//
//  ServiceLocator.swift
//  Otus_Pro_2
//
//  Created by Илья Кузнецов on 26.03.2024.
//

import Foundation

class ServiceLocator {
    
    private var services: [String: Any] = [:]
    static let shared = ServiceLocator()
    
    private init() {
        let everythingNewsService = configureEverythingNewsService()
        let hotNewsService = configureHotNewsService()
        
        let everythingNewsServiceKey = String(describing: EverythingNewsService.self)
        let hotNewsServiceKey = String(describing: HotNewsService.self)
        
        services[everythingNewsServiceKey] = everythingNewsService
        services[hotNewsServiceKey] = hotNewsService
    }
    
    func getService<T>() -> T {
        let key = String(describing: T.self)
        return services[key] as! T
    }
    
    private func configureEverythingNewsService() -> IEverythingNewsService {
        return EverythingNewsService()
    }
    
    private func configureHotNewsService() -> IHotNewsService {
        return HotNewsService()
    }
    
}
