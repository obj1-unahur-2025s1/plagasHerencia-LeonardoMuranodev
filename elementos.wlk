class Hogar {
  var property nivelMugre 
  var property confort 

  method esBueno() = nivelMugre < confort / 2
}

class Huerta {
  var property produccion 
  var property confort 

  method esBueno() = produccion > nivelProduccion.nivelProduccionRequerido()
}

object nivelProduccion {
  var property nivelProduccionRequerido = 23
}

class Mascota {
  var property salud

  method esBueno() = salud > 250
}

class Barrio {
  const property elementos = []

  //Metodos de consulta
  method esBueno(unElemento) = unElemento.esBueno()

  method esCopado() =  self.cantElementosBuenos() > self.cantElementosMalos()

  method cantElementosBuenos() = elementos.count({elemento => elemento.esBueno()})
  method cantElementosMalos() = elementos.count({elemento =>  not elemento.esBueno()})
}