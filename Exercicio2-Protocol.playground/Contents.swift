import Cocoa

protocol Voador {
    func voar()
}

class Pato: Voador {
    func voar() {
        print("Estou voando como um pato")
    }
}

class Aviao: Voador {
    func voar() {
        print("Estou voando como um aviao")
    }
}

class SuperHomem: Voador {
    func voar() {
        print("Estou voando como um campeao")
    }
}

class TorreDeControle {
    private var listaVoadores = [Voador]()
    
    func voamTodos(){
        for i in listaVoadores{
            i.voar()
        }
    }
    
    func adicionarVoador(voador: Voador){
        listaVoadores.append(voador)
    }
    
    func adicionaVoadores(array: [Voador]){
        listaVoadores.append(contentsOf: array)
    }
    
    func verVoadores(){
        for voador in listaVoadores {
            print(voador)
        }
    }
}


let duck: Pato = Pato()
let airplane: Aviao = Aviao()
let man: SuperHomem = SuperHomem()
let tower = TorreDeControle()

tower.adicionaVoadores(array: [duck, airplane, man])
tower.verVoadores()
