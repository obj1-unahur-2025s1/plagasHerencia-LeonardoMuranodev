//clase padre = super clase ---> El hijo dice quien es su padre. inherits es la palabra reservada

//El metodo abstracto hace que la clase sea una clase abstracta, lo cual hace que no pueda instanciarla, algo que es util aca
class Plaga {
    var poblacion
    method daño() = poblacion
    method transmiteEnfermedades() = poblacion >= 10 && self.condicionAdicional()
    method condicionAdicional() //metodo abstracto: debe estar la condicion adicional si se usa, sino fallara

    //Metodos de indicacion
    method atacar(unElemento) {
        self.sufrirEfectosDeAtaque()
        unElemento.sufrirEfectos(self)
    }

    method sufrirEfectosDeAtaque() {
        poblacion += poblacion * 0.1
    }
}

//Dos maneras de sobreescribir metodos, con super() y la clase abstracta

//override (sobrescribir: cambia un metodo que tiene la clase padre en el hijo)

//super(): el metodo tiene que tener el mismo nombre para que super funcione. Ademas de la palabra override del principio
class Cucarachas inherits Plaga{
    var pesoPromedio

    override method daño() = super() * 0.5
    override method condicionAdicional() = pesoPromedio >= 10

    //Metodos de indicacion
    override method sufrirEfectosDeAtaque() {
      super()
      pesoPromedio += 2
    }
}

class Pulgas inherits Plaga{
    override method daño() = super() * 2
    override method condicionAdicional() = true
}

//Herencia simple (un padre) de clases: Fijarse como Garrapatas hereda de Pulgas y Pulas de Plaga
// Abuelo --> Padre --> Nieto
class Garrapatas inherits Pulgas{

    //Metodos de indicacion
    override method sufrirEfectosDeAtaque() {
      poblacion += poblacion * 0.2
    }
}

class Mosquitos inherits Plaga{
    override method condicionAdicional() = poblacion % 3 == 0
}