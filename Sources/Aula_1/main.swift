import Foundation

enum NivelExperiencia : String{
    case iniciante = "iniciante"
    case intermediario = "intermediario"
    case avancado = "avançado"
}

enum AulasOferecidas : String{
    case muscalacao = "musculação"
    case spinning = "spinning"
    case yoga = "yoga"
    case luta = "luta"
    case funcional = "funcional"
}

class Plano{
    private var nome: String
    private var valormensal: Int
    private var personalTrainer: Bool
    private var limAulas: Int
    private var duracao: Int
    init (nome: String, valormensal: Int, personalTrainer: Bool, limAulas: Int, duracao: Int){
        self.nome = nome
        self.valormensal = valormensal
        self.personalTrainer = personalTrainer
        self.limAulas = limAulas
        self.duracao = duracao
    }

    static var mensal: Plano {
        return Plano(nome: "Plano Mensal", preco: 29.90, periodicidade: "Mensal")
    }

    static var trimestral: Plano {
        return Plano(nome: "Plano Trimestral", preco: 79.90, periodicidade: "Trimestral")
    }

    static var anual: Plano {
        return Plano(nome: "Plano Anual", preco: 249.90, periodicidade: "Anual")
    }
}

