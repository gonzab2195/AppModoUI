//
//  Images.swift
//  AppModoUI
//
//  Created by Gonzalo Berro on 20/01/2024.
//

import Foundation

struct Images {
    
    static func getImageFromUrl(){
        if let url = URL(string: "https://ejemplo.com/tu-imagen.jpg") {
           // Crear una tarea de URLSession para descargar los datos de la imagen
           let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
               // Verificar si hay algún error
               if let error = error {
                   print("Error al descargar la imagen: \(error.localizedDescription)")
                   return
               }

               // Verificar si se pudieron obtener datos de la respuesta
               guard let data = data else {
                   print("No se pudieron obtener datos de la respuesta")
                   return
               }

               // Crear la UIImage con los datos descargados
               if let image = UIImage(data: data) {
                   // La imagen está lista para ser utilizada
                   DispatchQueue.main.async {
                       // Puedes actualizar la interfaz de usuario en el hilo principal
                       // Por ejemplo, configurar una UIImageView con la imagen
                       let imageView = UIImageView(image: image)
                       imageView.translatesAutoresizingMaskIntoConstraints = false
                       self.view.addSubview(imageView)

                       // Configurar restricciones según sea necesario
                       NSLayoutConstraint.activate([
                           imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                           imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                           imageView.widthAnchor.constraint(equalToConstant: 200),
                           imageView.heightAnchor.constraint(equalToConstant: 200)
                       ])
                   }
               }
           }

           // Iniciar la tarea de descarga
           task.resume()
       }
    }
    
}
