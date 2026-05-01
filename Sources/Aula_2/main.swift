import Foundation

protocol Manutencao{
    var nomeMaquina: String {get}
    var historicoMaquina: [String] {get}
    
    func realizarManutencao(data: String) -> Bool
    func estaFuncionando() -> Bool
}

class Aparelho: Manutencao{
    let nomeMaquina: String
    private (set) var historicoMaquina: [String] = []

    init (nomeMaquina: String){
        self.nomeMaquina = nomeMaquina
    }

    func realizarManutencao(data: String) -> Bool{
        guard estaFuncionando() else{
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

protocol Aula{
    var nome: String {get}
    var instrutor: String {get}
    var categoria: String {get}
    var descricao: String {get}
}

class TurmaColetiva: Aula{
    let nome: String
    let instrutor: String
    let categoria: String
    let descricao: String
    private (set) var inscricao: Bool
    private (set) static var cont: Int = 0

    init (nome: String, instrutor: String, categoria: String, descricao: String){
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
        inscricao = false
    }

    func fazerInscricao() -> Bool{

        if (!inscricao&&TurmaColetiva.cont<20){
            print ("Inscricao feita com sucesso.")
            inscricao = true
            TurmaColetiva.cont += 1
            return true
        }
        else if (inscricao&&TurmaColetiva.cont<20) {
            print("Inscricao ja foi realizada anteriormente.")
            return false
        }
        else{
            print("Inscricoes esgotadas.")
            return false
        }
    }
}

class TreinoComPersonal: Aula{
    let nome: String
    let instrutor: String
    let categoria: String
    let descricao: String

    init (nome: String, instrutor: String, categoria: String, descricao: String){
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
    }
}