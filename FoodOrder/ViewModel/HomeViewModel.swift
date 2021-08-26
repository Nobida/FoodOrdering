//
//  HomeViewModel.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/26.
//

import SwiftUI
import CoreLocation

class HomeViewModel: NSObject,ObservableObject, CLLocationManagerDelegate{
    
    @Published var search = ""
    @Published var locationManager = CLLocationManager()
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //checking Location Access.....
        print(manager.authorizationStatus)
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("authorized")
        case .denied:
            print("denied")
        default:
            print("unknown")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
