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

struct PlanosConfig{
    let nome: String
    let valormensal: Double
    let personalTrainer: Bool
    let limAulas: Int
    let duracao: Int
}

enum CatalogoPlanos{
    case mensal
    case trimestral 
    case anual

    var atributos: PlanosConfig{
        switch self{
            case .mensal: return PlanosConfig(nome: "Mensal Simples", valormensal: 100, personalTrainer: false, limAulas: 10, duracao: 2)
            case .trimestral: return PlanosConfig (nome: "Trimestral Premium", valormensal: 200, personalTrainer: true, limAulas: 20, duracao: 6)
            case .anual: return PlanosConfig (nome: "Anual VIP", valormensal: 300, personalTrainer: true, limAulas: 30, duracao: 24)
        }
    }
}

class Pessoa{
    let nome: String
    let email: String
    let funcao: String

    init(nome: String, email: String, funcao: String){
        self.nome = nome
        self.email = email
        self.funcao = funcao
    }

}

class Aluno: Pessoa{
    let matricula: String
    var plano: CatalogoPlanos
    var nivel: NivelExperiencia
    init(nome: String, email: String, funcao: String, matricula: String, plano: CatalogoPlanos, nivel: NivelExperiencia){
        self.matricula = matricula
        self.plano = plano
        self.nivel = nivel
        super.init(nome: nome, email: email, funcao: "Aluno")
    }
}

class Instrutor: Pessoa{
    let especialidade: AulasOferecidas
    let idFuncionario: String
    init(nome: String, email: String, funcao: String, especialidade: AulasOferecidas, idFuncionario: String){
        self.especialidade = especialidade
        self.idFuncionario = idFuncionario
        super.init(nome: nome, email: email, funcao: "Instrutor")
    }
}

