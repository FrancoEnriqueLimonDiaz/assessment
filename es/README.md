# Kredi Sr. Backend Developer
## Contenidos

- [General](#general)
- [Reglas](#reglas)
- [Recomendaciones](#recomendaciones)
- [Ruby quiz](#ruby-quiz)
- [Challenges](#challenges)

## General

Somos [Kredi](https://www.kredi.mx), Una fintech Mexicana enfocada en creditos hipotecarios en LatAm,Nos enfocamos en el desarrollo de software para procesos financieros críticos,nuestra meta es ofrecer al cliente la mejor experiencia al solicitar un crédito hipotecario a la vez que reducimos el tiempo de espera entre la solicitud y la formalización del crédito, nuestro equipo de desarrollo está enfocado en entrefar código de calidad, usable, legible, principios [S.O.L.I.D.](https://www.honeybadger.io/blog/ruby-solid-design-principles/#:~:text=The%20SOLID%20design%20principle%20includes,Liskov%20Substitution%20Principle), y las mejores prácticas en la industria.

A continuación presentamos un pequeño cuestionario para nuestra posición como Desarrollador de Software Backend Sr., te invitamos a seguir las recomendaciones para poder llevar a acabo esta prueba.

## Reglas

No hay reglas ;) desarrollar software debe ser algo que lleves en la sangre, que te motive y que te diviertas, que pienses en tu código como el trabajo en equipo, más personas trabajarán contigo.

## Recomendaciones

- **Por favor no menciones el nombre de la empresa en tu repositorio de entrega**
- Sé honesto, no copies de stackoverflow, a veces como programadores hacemos eso, pero esta vez queremos evaluar tu proceso de razonamiento, la forma en que planteas una solución a un problema así como la calidad de código.
- Haz uso de las mejores prácticas, usa nombres de variables entendibles, checa tu indentación, legibilidad del código, DRY, S.O.L.I.D., patrones de diseño, etc.
- Usa convenciones de código de ruby y ruby on rails
- Escribe pruebas de tu código, no sólo en terminal, te recomendamos usar RSpec.
- Publica tu código en `Github || Gitlab` preferentemente en un repositorio público, si no te es posible, usa un repositorio privado pero asegurate de invitar al Hiring manager.
- Pon cuidado en la descripción de tus commits, preferentemente en inglés técnico.
- Nos emociona ver que publiquen el proyecto en heroku, ver funcionar tu mini-proyecto es de las mejores experiencias que hemos tenido.
- Si requieres de ayuda o tienes dudas, por favor no dudes en comunicarte con el hiring manager.
- Evita que tu aplicación incurra en consultas n+1.

### Recomendaciones para el cuestionario

1. Respira, relájate, no te sientas presionado, no queremos que respondas todo sin interrupciones.
2. Compartirás pantalla con el equipo que te entreviste.
3. Tienes permitido preguntar al equipo dudas generales sobre métodos o módulos del core de Ruby, pero no la respuesta completa.
4. Al igual que el paso 2, puedes usar google para buscar documentación sobre métodos, módulos, etc. pero no la respuesta completa.
5. Interpreta esta sesión como una sesión de pair programming.
6. Prepárate con antelación, si llevas tiempo sin trabajar con Ruby o sientes que necesitas un repaso, ¡Hazlo! te recomendamos revisar módulos como Enumerable, String, métodos, parámetros, etc.
7. Haz tu mayor esfuerzo!

# Instrucciones

Cuestionario (Parte I):

A continuación te presentamos cinco preguntas sobre conocimientos generales de ruby, la idea es que podamos tener una llamada y juntos resolvamos las preguntas, queremos ver como analizas y resuelves problemas, descuida, te aseguramos que pediremos que hagas reverse de árboles binarios y esas cosas.


## Parte I
### Ruby Quiz

Para esta prueba tenemos planeado hacer una llamada por zoom o meet y hacer más ameno el proceso, queremos interactuar contigo, siéntete libre de hacer preguntas o si eres muy hábil nos gustaría aprender de tu experiencia.

#### 1. Escribe una función que compare si dos cadenas de texto son iguales independientemente si son mayúsculas o minúsculas.

```ruby
>> compare('nice', 'nice')
=> true
>> compare('how', 'who')
=> false
>> compare('GoOd DaY', 'gOOd dAy')
=> true
>> compare('foo', 'food')
=> false
```

#### 2. Escribe una función que compare si dos cadenas son anagramas (asume que los parámetros que recibes son solo letras del alfabeto y espacios)

```ruby
>> anagram?('Tap', 'paT')
=> true
>> anagram?('beat', 'table')
=> false
>> anagram?('beat', 'abet')
=> true
>> anagram?('seat', 'teal')
=> false
>> anagram?('god', 'Dog')
=> true
```

#### 3. Escribe una función que ordene las llaves (keys) de un hash por la lóngitud de la llave.

```ruby
{ abc: 'hello', another_key: 123, 4567 => 'third' }
```

should result in:

```ruby
["abc", "4567", "another_key"]
```


#### 4. Escribe una función que retorne el producto de todos los elementos de un arreglo o rango que recibe en un argumento array/range

```ruby
>> product([1, 4, 21])
=> 84
>> product([-4, 2.3e12, 77.23, 982, 0b101])
=> -3.48863356e+18
>> product([-3, 11, 2])
=> -66
>> product([8, 300])
=> 2400
>> product([234, 121, 23, 945, 0])
=> 0
>> product(1..5)
=> 120
```

#### 5. Escribe un método que te devuelva las fichas de un juego de dominó (28 fichas) en el formato `[ [0,0], [0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [1,1], [1,2], ... ]` donde cada `[num1, num2]` representa una ficha.

```ruby

def domino_tiles
  #...
end

#> [ [0,0], [0,1], [0,2], [0,3], ... ]
```


# Challenges

Nos interesa saber cómo estructuras un proyecto, base de código, pruebas, etc.


### [Challenge: Acortador de URL's](es/a1/README.md)

<!-- ### [Challenge 2: API para manejo de proyectos](es/a2/README.md)

<br/>
<br/> -->

### Happy coding! :)