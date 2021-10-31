//
//  FilterModel.swift
//  random-rango
//
//  Created by Luiz Felipe Clemente Claro on 31/10/21.
//

import Foundation

public enum QuantidadePessoas: Int, Decodable {
    case sozinho = 0
    case casal = 1
    case galera = 2
}
public enum Refeicao: Int, Decodable {
    case cafeManha = 0
    case almoco = 1
    case janta = 2
}
public enum Valor: Int, Decodable {
    case barato = 0
    case medio = 1
    case caro = 2
}
public enum Estilo: Int, Decodable {
    case tradicional = 0
    case exotico = 1
}

public struct FilterModel: Equatable, Decodable {
    public let quantidadePessoas: QuantidadePessoas
    public let refeicao: Refeicao
    public let valor: Valor
    public let estilo: Estilo
    public let image: String
    public let nome: String
    public let texto: String
    public init(quantidadePessoas: QuantidadePessoas, refeicao: Refeicao, valor: Valor, estilo: Estilo, image: String, nome: String, texto: String) {
        self.quantidadePessoas = quantidadePessoas
        self.refeicao = refeicao
        self.valor = valor
        self.estilo = estilo
        self.image = image
        self.nome = nome
        self.texto = texto
    }
}
