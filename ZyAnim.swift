//
//  ZyAnim.swift
//  zy_lib_dummy_ocr_ios
//
//  Created by Jorge Saenz Ugaz on 1/08/24.
//

import Foundation
import Lottie


class ZyAnim {
    public static func listAllLottieJSONFilesInPod(ivControl: UIImageView, psAnimationName: String) {
        // Obtén el bundle del pod usando el nombre del pod
        let podBundle = Bundle(for: self)
        
        // Obtén el path del bundle del pod
        guard let resourcePath = podBundle.resourcePath else {
            print("Resource path not found")
            return
        }
        
        do {
            // Listar todos los archivos en el directorio del bundle del pod
            let fileURLs = try FileManager.default.contentsOfDirectory(atPath: resourcePath)
            
            // Filtrar solo los archivos .json
            let jsonFiles = fileURLs.filter({ $0.contains("\(psAnimationName).json") })
        
            //Obteniendo Path
            if !jsonFiles.isEmpty {
                let filePath = (resourcePath as NSString).appendingPathComponent(jsonFiles[0])
                
                // Crea y configura el LottieAnimationView
                let animationView = LottieAnimationView(filePath: filePath)
                animationView.frame = ivControl.bounds
                animationView.contentMode = .scaleAspectFit
                animationView.loopMode = .loop
                ivControl.addSubview(animationView)
                
                // Reproduce la animación
                animationView.play()
            }
        } catch {
            print("Error while enumerating files \(resourcePath): \(error.localizedDescription)")
        }
    }
}
