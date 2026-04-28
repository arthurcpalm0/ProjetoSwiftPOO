import Foundation

protocol Manutencao{
    var nomeMaquina: String {get}
    var historicoMaquina: String {get}
    
    func realizarManutencao(data: String) -> Bool
    func estaFuncionando() -> Bool
}

class Aparelho: Manutencao{
    let nomeMaquina
    private (set) var historicoMaquina: String = []
    private (set) var estaFuncionando: Bool = true

    init (nomeMaquina: String){
        self.nomeMaquina = nomeMaquina
    }

    func realizarManutencao(data: String) -> Bool{
        guard estaFuncionando else{
            print ("A maquina \(nomeMaquina) está quebrada.")
            return false
        }
        historicoMaquina.append(data)
        print("Manutenção feita com sucesso")
        return true
    }

    func estaFuncionando() -> Bool{
        return historicoMaquina.isEmpty
    }
}