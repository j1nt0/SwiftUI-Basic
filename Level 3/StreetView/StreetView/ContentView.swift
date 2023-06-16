//
//  ContentView.swift
//  StreetView
//
//  Created by 이진 on 2023/06/13.
//

import SwiftUI
import CoreLocation
import AVFoundation

class FlashlightManager: ObservableObject {
    private let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
    
    @Published var isFlashlightOn = false
    
    init() {
        guard let device = captureDevice else { return }
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                device.torchMode = .off
                device.unlockForConfiguration()
            } catch {
                print("Failed to access flashlight.")
            }
        }
    }
    
    func toggleFlashlight() {
        guard let device = captureDevice else { return }
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                device.torchMode = isFlashlightOn ? .off : .on
                device.unlockForConfiguration()
                isFlashlightOn.toggle()
            } catch {
                print("Failed to access flashlight.")
            }
        }
    }
}

class CompassManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var heading: Double = 0.0
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.heading = newHeading.trueHeading
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()

    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
    }
}

struct StreetView: View {
    
    @Binding var isTakePicture: Bool
    let apiKey: String
    let latitude: Double
    let longitude: Double
    let heading: Int

    var body: some View {
        if isTakePicture {
            if let streetViewURL = URL(string: "https://maps.googleapis.com/maps/api/streetview?size=400x250&location=\(latitude),\(longitude)&fov=80&heading=\(heading)&key=\(apiKey)") {
                AsyncImageView(url: streetViewURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600)
            } else {
                Text("Failed to load Street View")
            }
        }
    }
}

struct AsyncImageView: View {
    @StateObject private var imageLoader: ImageLoader
    
    init(url: URL) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                EmptyView()
            }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
        loadImage()
    }
    
    func loadImage() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}

struct GuideLine: View {
    
    var body: some View {
        HStack {
            Spacer()
            Rectangle()
                .frame(width: 0.8)
                .foregroundColor(.white)
            Spacer()
            Rectangle()
                .frame(width: 0.8)
                .foregroundColor(.white)
            Spacer()
        }
        VStack {
            Spacer()
            Rectangle()
                .frame(height: 0.8)
                .foregroundColor(.white)
            Spacer()
            Rectangle()
                .frame(height: 0.8)
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct ShutterButton: View {
    
    @ObservedObject private var locationManager = LocationManager()
    @Binding var isTakeFicture: Bool
    @Binding var isShutterOpen: Bool
    
    var body: some View {
        Button {
            if !isTakeFicture {
                isShutterOpen = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isShutterOpen = false
                }
                isTakeFicture = true
            }
        } label: {
            ZStack{
                Circle().foregroundColor(.white).frame(width: 80)
                Circle().stroke(Color.white, lineWidth: 5).frame(width: 95)
            }
        }
    }
}

struct FlashButton: View {
    
    @StateObject private var flashlightManager = FlashlightManager()
    
    var body: some View {
        Button {
            flashlightManager.toggleFlashlight()
        } label: {
            Image(systemName: "bolt.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundColor(.white)
        }
    }
}

struct ResetButton: View {
    
    @Binding var isTakeFicture: Bool
    
    var body: some View {
        Button {
            isTakeFicture = false
        } label: {
            Image(systemName: "arrow.triangle.2.circlepath")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .foregroundColor(.white)
        }
    }
}

struct ContentView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    @ObservedObject private var compassManager = CompassManager()
    @State private var isTakeFicture = false
    @State private var isShutterOpen = false
    @State private var isLightning = false
    @State private var justFake = true
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            HStack {
                Spacer()
                VStack {
                    Button {
                        justFake.toggle()
                    } label: {
                        Image(systemName: "bolt")
                            .foregroundColor(.black)
                    }

                    Spacer()
                    FlashButton()
                }
                .padding(.vertical,50)
                Spacer()
                ZStack {
                    if isTakeFicture {
                        StreetView(isTakePicture: $isTakeFicture, apiKey: "api-key", latitude: locationManager.latitude, longitude: locationManager.longitude, heading: (Int(compassManager.heading)+90) % 360)
                    }
                    else {
                        if justFake {
                            Image("background")
                                .resizable()
                        } else {
                            Rectangle().foregroundColor(.blue)
                        }
                        
                    }
                    GuideLine()
                }
                .scaleEffect(isShutterOpen ? 0.95 : 1.0)
                .animation(.easeInOut(duration: 0.1))
                .frame(width: 600)
                Spacer()
                ZStack {
                    ShutterButton(isTakeFicture: $isTakeFicture, isShutterOpen: $isShutterOpen)
                    VStack {
                        ResetButton(isTakeFicture: $isTakeFicture)
                        Spacer()
                    }
                    .padding(.vertical,50)
                }
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
