package leitorcasouso

class RegraNegocio {
    String codigo
    String titulo
    String descricao

    static belongsTo = CasoDeUso
    static hasMany = [mensagens: Mensagem, casosDeUso: CasoDeUso]

    static constraints = {
        codigo nullable: false, blank: false, maxSize: 255, unique: true
        titulo nullable: false, blank: false, maxSize: 255
        descricao nullable: false, blank: false
        mensagens nullable: true
    }

    static mapping = {
        descricao type: "text"
    }
}
