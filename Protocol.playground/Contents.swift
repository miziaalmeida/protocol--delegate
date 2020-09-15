import Cocoa


//Cria o protocolo
protocol Imprimivel {
    func imprimir()
}

//Cria classes que implementem o protocolo
class Contrato: Imprimivel {
    func imprimir() {
        print("Sou um contrato muito legal")
    }
}

class Foto: Imprimivel {
    func imprimir() {
        print("Sou uma selfie")
    }
}

class Documento: Imprimivel {
    func imprimir() {
         print("Sou um documento Word")
    }
}

class Boleto: Imprimivel {
    func imprimir() {
        print("Vai ter que me pagar")
    }
}

class Impressora{
    private var listaImprimiveis = [Imprimivel]()
    
    func imprimirTudo(){
        for item in listaImprimiveis{
            item.imprimir()
        }
        
    }
    
    func agregarImprimivel(imprimivel: Imprimivel){
        listaImprimiveis.append(imprimivel)
    }
}

let impressoraH = Impressora()
impressoraH.agregarImprimivel(imprimivel: Boleto())

impressoraH.agregarImprimivel(imprimivel: Foto())

impressoraH.agregarImprimivel(imprimivel: Documento())

impressoraH.agregarImprimivel(imprimivel: Contrato())

impressoraH.imprimirTudo()


