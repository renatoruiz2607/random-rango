//
//  FilterService.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 31/10/21.
//

import Foundation

class FilterService {
    let url = "https://demo6610750.mockable.io/restaurants"
    
    func getRestaurant(completion: @escaping (FilterModel?) -> Void ) {
        let session = URLSession.shared
        let url = URL(string: url)!
        let task = session.dataTask(with: url){ data,response,error in
            do{
                guard let json = try JSONSerialization.jsonObject(with: data!, options:[]) as? NSDictionary else { return }
                let model = converterJsonParaModel(json: json)
                completion(model)
            } catch {
                print("json error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}

    func converterJsonParaModel(json: NSDictionary) -> FilterModel? {
        guard let nome = json["nome"] as? String else { return nil }
        guard let texto = json["texto"] as? String else { return nil }
        guard let imagem = json["imagem"] as? String else { return nil }
        guard let quantidadePessoas = json["quantidadePessoas"] as? QuantidadePessoas else { return nil }
        guard let refeicao = json["refeicao"] as? Refeicao else { return nil }
        guard let valor = json["valor"] as? Valor else { return nil }
        guard let estilo = json["estilo"] as? Estilo else { return nil }

        return .init(quantidadePessoas: quantidadePessoas, refeicao: refeicao, valor: valor, estilo: estilo, image: imagem, nome: nome, texto: texto)
}
