package leitorcasouso

class Mensagem {
    String codigo
    String descricao

    static constraints = {
        codigo nullable: false, blank: false, maxSize: 255, unique: true
        descricao nullable: false, blank: false
    }

    static mapping = {
        descricao type: "text"
    }
}
