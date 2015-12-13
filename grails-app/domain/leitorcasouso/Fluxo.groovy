package leitorcasouso

abstract class Fluxo {
    String codigo
    String descricao

    static hasMany = [mensagens: Mensagem]

    static constraints = {
        codigo nullable: false, blank: false, maxSize: 255
        descricao nullable: false, blank: false
    }

    static mapping = {
        descricao type: "text"
        tablePerHierarchy true
    }
}
