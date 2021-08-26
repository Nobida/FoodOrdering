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
    
    // Location Details....
    @Published var userLocation: CLLocation!
    @Published var userAddress = ""
    @Published var noLocation = false
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //checking Location Access.....

        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("authorized")
            self.noLocation = false
            manager.requestLocation()
        case .denied:
            print("denied")
            self.noLocation = true
        default:
            print("unknown")
            self.noLocation = false
            //Direct Call
            locationManager.requestWhenInUseAuthorization()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.userLocation = locations.last
        self.extractLocation()
        
        //reading User Location And Extracting Details...
    }
    
    func extractLocation() {
        CLGeocoder().reverseGeocodeLocation(self.userLocation) {(res, err) in
            guard let safeData = res else { return }
            var address = " "
            address += safeData.first?.name ?? ""
            address += ", "
            address += safeData.first?.locality ?? ""
            self.userAddress = address
            print(safeData)
            
        }
    }
    

}
