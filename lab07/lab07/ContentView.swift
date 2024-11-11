//
//  ContentView.swift
//  lab07
//
//  Created by atipaq on 11/11/24.
//
// Ing. Sistemas -16.406337627803232, -71.52483352718367
// ccUnsa -16.397793953019814, -71.53746879251587
// Arequipa -16.40511871330541, -71.5380683953517

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Coordenadas temporales
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State private var route: MKRoute?
    
    // Coordenadas de destino
    let destinationCoordinate = CLLocationCoordinate2D(latitude: -16.397648012818447, longitude: -71.53749973294995)

    var body: some View {
        ZStack {
            MapView(mapRegion: $mapRegion, route: $route, destinationCoordinate: destinationCoordinate)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    updateRegionToUserLocation()
                    calculateRoute()
                }
        }
        .onReceive(locationManager.$userLocation) { newLocation in
            if let newLocation = newLocation {
                mapRegion.center = newLocation
            }
        }
    }

    func updateRegionToUserLocation() {
        if let userLocation = locationManager.userLocation {
            mapRegion = MKCoordinateRegion(
                center: userLocation,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }

    func calculateRoute() {
        guard let userLocation = locationManager.userLocation else { return }

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first, error == nil else {
                print("Error al calcular la ruta:", error?.localizedDescription ?? "Desconocido")
                return
            }

            self.route = route
            mapRegion.center = destinationCoordinate
        }
    }
}

struct MapView: UIViewRepresentable {
    @Binding var mapRegion: MKCoordinateRegion
    @Binding var route: MKRoute?
    var destinationCoordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(mapRegion, animated: true)
        mapView.showsUserLocation = true
        
        // Agrega el pin del destino
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = destinationCoordinate
        destinationAnnotation.title = "CCUnsa"
        mapView.addAnnotation(destinationAnnotation)
        
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(mapRegion, animated: true)
        
        // Remueve rutas anteriores y agrega la nueva si existe
        uiView.removeOverlays(uiView.overlays)
        if let route = route {
            uiView.addOverlay(route.polyline)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}
