package leitorcasouso

class CasoDeUso {
    String nome
    String descricao
    String preCondicoes
    String posCondicoes
    String informacoes
    List<FluxoAlternativo> fluxosAlternativos
    List<FluxoExcecao> fluxosExcecao

    static hasMany = [fluxosAlternativos: FluxoAlternativo, fluxosExcecao: FluxoExcecao,
            regrasNegocio: RegraNegocio, mensagens: Mensagem]
    static hasOne = [fluxoPrincipal: FluxoBasico]

    static constraints = {
        nome nullable: false, blank: false
        descricao nullable: false, blank: false
        fluxoPrincipal nullable: false
        preCondicoes nullable: true, blank: true
        posCondicoes nullable: true, blank: true
    }

    static mapping = {
        descricao type: "text"
        preCondicoes type: "text"
        posCondicoes type: "text"
        informacoes type: "text"
        fluxosAlternativos indexColumn: [name: "sequencial", type: Integer], cascade:"all-delete-orphan"
        fluxosExcecao indexColumn: [name: "sequencial", type: Integer], cascade:"all-delete-orphan"
    }
}
