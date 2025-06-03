import plagas.*

class Hogar {
  var property nivelMugre 
  var property confort 

  method esBueno() = nivelMugre < confort / 2

  method sufrirEfectos(unaPlaga) {
    nivelMugre += unaPlaga.daño()
  }
}

class Huerta {
  var produccion 

  method produccion() = produccion

  method esBueno() = produccion > nivelProduccion.nivelProduccionRequerido()

  method sufrirEfectos(unaPlaga) {
    produccion -= unaPlaga.daño() * 0.1 + if (unaPlaga.transmiteEnfermedades()) 10 else 0
  }
}

object nivelProduccion {
  var property nivelProduccionRequerido = 23
}

class Mascota {
  var property salud

  method esBueno() = salud > 250

  method sufrirEfectos(unaPlaga) {
    salud -= if(unaPlaga.transmiteEnfermedades()) unaPlaga.daño() else 0
  }
}

class Barrio {
  const elementos = []

  //Metodos de consulta
  method esBueno(unElemento) = unElemento.esBueno()

  method esCopado() =  self.cantElementosBuenos() > self.cantElementosMalos()

  method cantElementosBuenos() = elementos.count({elemento => elemento.esBueno()})
  method cantElementosMalos() = elementos.count({elemento =>  not elemento.esBueno()})

  //metodos de indicacion
  method agregarElementos(listaElemento) {
    elementos.addAll(listaElemento)
  }
}