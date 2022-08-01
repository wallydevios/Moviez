//
//  NetworkManager.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//
import Foundation

class NetworkManager {
    
    func getMovies(stringUrl: String, completion: @escaping(SearchRequest) ->()) {
            
            guard let url = URL(string: stringUrl) else {
                fatalError("MAMASTE CON EL LINK")
            }
            
            URLSession.shared.dataTask(with: url) { datos, respuesta, error in
                
                guard let data = datos, error == nil, let response = respuesta as? HTTPURLResponse else {
                    return
                }
                
                if response.statusCode == 200 {
                    
                    print("Conexion exitosa con el servidor")
                    
                    do {
                        
                        let moviesResults = try JSONDecoder().decode(SearchRequest.self, from: data)
                        
                        DispatchQueue.main.async {
                            completion(moviesResults)
                        }
                        
                    } catch let error {
                        print(error.localizedDescription)
                        print("Error al decodificar")
                    }
                    
                }
            }.resume()
            
        }
    
    func getDetails(stringUrl: String, completion: @escaping(DetailResults) ->()) {
            
            guard let url = URL(string: stringUrl) else {
                fatalError("MAMASTE CON EL LINK")
            }
            
            URLSession.shared.dataTask(with: url) { datos, respuesta, error in
                
                guard let data = datos, error == nil, let response = respuesta as? HTTPURLResponse else {
                    return
                }
                
                if response.statusCode == 200 {
                    
                    print("Conexion exitosa con el servidor")
                    
                    do {
                        
                        let detailResults = try JSONDecoder().decode(DetailResults.self, from: data)
                        
                        DispatchQueue.main.async {
                            completion(detailResults)
                        }
                        
                    } catch let error {
                        print(error.localizedDescription)
                        print("Error al decodificar")
                    }
                    
                }
            }.resume()
            
        }

    
}
