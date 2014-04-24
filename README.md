Majestic 12
============
_Se tu propia agencia de inteligencia_

Aplicacion para mapear relaciones entre entidades 
(empresas, personas, organizaciones, etc.)


![MJ12](captura.png)

### Entidad

Entidad a relacionar, con posibilidad de agregar
metadata a la entidad.

### Enlaces

Relacion entre dos entidades con posibilidad de agregar
metadata a la relacion.

### Meta

A las entidades y relaciones les podes agregar metadata.

### Exportar, Importar y Bases de Datos

@TODO Que se puedan guardar y recuperar diferentes bases de datos, por ahora se puede manual

Exporta las entidades, relaciones y metadata en formato 
json y se puede importar en el mismo formato.

## Dependencias

_Ante cualquier error revisar las dependencias!_
Puede funcionar con otras versiones pero esta probado 
con estas

**Ruby 1.9.3**

    ruby -v

**Rails 4.0**

    rails -v

**Ruby Gems 1.8.23**

    gem -v 

**Bundler 1.5.2**

    bundle -v

**Copypasta**

    sudo apt-get install ruby1.9.3 rails rubygems bundler

## Instalar

    git clone https://github.com/sudoaza/mj12.git

    bundle install

    rake db:create


## Correr

    rails s
    
    Visitar http://localhost:3000


