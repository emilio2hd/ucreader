databaseChangeLog = {

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-1") {
        createTable(tableName: "caso_de_uso") {
            column(autoIncrement: "true", name: "id", type: "bigint") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "caso_de_usoPK")
            }

            column(name: "version", type: "bigint") {
                constraints(nullable: "false")
            }

            column(name: "descricao", type: "longtext") {
                constraints(nullable: "false")
            }

            column(name: "informacoes", type: "longtext") {
                constraints(nullable: "false")
            }

            column(name: "nome", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "pos_condicoes", type: "longtext")

            column(name: "pre_condicoes", type: "longtext")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-2") {
        createTable(tableName: "caso_de_uso_fluxo_alternativo") {
            column(name: "caso_de_uso_fluxos_alternativos_id", type: "bigint")

            column(name: "fluxo_alternativo_id", type: "bigint")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-3") {
        createTable(tableName: "caso_de_uso_fluxo_excecao") {
            column(name: "caso_de_uso_fluxos_excecao_id", type: "bigint")

            column(name: "fluxo_excecao_id", type: "bigint")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-4") {
        createTable(tableName: "caso_de_uso_mensagem") {
            column(name: "caso_de_uso_mensagens_id", type: "bigint")

            column(name: "mensagem_id", type: "bigint")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-5") {
        createTable(tableName: "fluxo") {
            column(autoIncrement: "true", name: "id", type: "bigint") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "fluxoPK")
            }

            column(name: "version", type: "bigint") {
                constraints(nullable: "false")
            }

            column(name: "codigo", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "descricao", type: "longtext") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-6") {
        createTable(tableName: "fluxo_alternativo") {
            column(name: "id", type: "bigint") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "fluxo_alternaPK")
            }

            column(name: "sequencial", type: "integer")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-7") {
        createTable(tableName: "fluxo_basico") {
            column(name: "id", type: "bigint") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "fluxo_basicoPK")
            }

            column(name: "caso_de_uso_id", type: "bigint") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-8") {
        createTable(tableName: "fluxo_excecao") {
            column(name: "id", type: "bigint") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "fluxo_excecaoPK")
            }

            column(name: "sequencial", type: "integer")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-9") {
        createTable(tableName: "fluxo_mensagem") {
            column(name: "fluxo_mensagens_id", type: "bigint")

            column(name: "mensagem_id", type: "bigint")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-10") {
        createTable(tableName: "mensagem") {
            column(autoIncrement: "true", name: "id", type: "bigint") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "mensagemPK")
            }

            column(name: "version", type: "bigint") {
                constraints(nullable: "false")
            }

            column(name: "codigo", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "descricao", type: "longtext") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-11") {
        createTable(tableName: "regra_negocio") {
            column(autoIncrement: "true", name: "id", type: "bigint") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "regra_negocioPK")
            }

            column(name: "version", type: "bigint") {
                constraints(nullable: "false")
            }

            column(name: "caso_de_uso_id", type: "bigint")

            column(name: "codigo", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "descricao", type: "longtext") {
                constraints(nullable: "false")
            }

            column(name: "titulo", type: "varchar(255)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-12") {
        createTable(tableName: "regra_negocio_mensagem") {
            column(name: "regra_negocio_mensagens_id", type: "bigint")

            column(name: "mensagem_id", type: "bigint")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-13") {
        addForeignKeyConstraint(baseColumnNames: "caso_de_uso_fluxos_alternativos_id", baseTableName: "caso_de_uso_fluxo_alternativo", constraintName: "FKDC8F1997DDDE7F2B", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "caso_de_uso", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-14") {
        addForeignKeyConstraint(baseColumnNames: "fluxo_alternativo_id", baseTableName: "caso_de_uso_fluxo_alternativo", constraintName: "FKDC8F19979194EDEB", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "fluxo_alternativo", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-15") {
        addForeignKeyConstraint(baseColumnNames: "caso_de_uso_fluxos_excecao_id", baseTableName: "caso_de_uso_fluxo_excecao", constraintName: "FKD90B4D3C23CE9661", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "caso_de_uso", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-16") {
        addForeignKeyConstraint(baseColumnNames: "fluxo_excecao_id", baseTableName: "caso_de_uso_fluxo_excecao", constraintName: "FKD90B4D3C13D3804B", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "fluxo_excecao", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-17") {
        addForeignKeyConstraint(baseColumnNames: "caso_de_uso_mensagens_id", baseTableName: "caso_de_uso_mensagem", constraintName: "FK6A627912DA12DA92", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "caso_de_uso", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-18") {
        addForeignKeyConstraint(baseColumnNames: "mensagem_id", baseTableName: "caso_de_uso_mensagem", constraintName: "FK6A627912F8BEAD38", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "mensagem", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-19") {
        addForeignKeyConstraint(baseColumnNames: "caso_de_uso_id", baseTableName: "fluxo_basico", constraintName: "FK5FC22CBA802723DA", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "caso_de_uso", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-20") {
        addForeignKeyConstraint(baseColumnNames: "fluxo_mensagens_id", baseTableName: "fluxo_mensagem", constraintName: "FKBA3376A4BE4B8D94", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "fluxo", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-21") {
        addForeignKeyConstraint(baseColumnNames: "mensagem_id", baseTableName: "fluxo_mensagem", constraintName: "FKBA3376A4F8BEAD38", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "mensagem", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-22") {
        addForeignKeyConstraint(baseColumnNames: "caso_de_uso_id", baseTableName: "regra_negocio", constraintName: "FK17CB7D0E802723DA", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "caso_de_uso", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-23") {
        addForeignKeyConstraint(baseColumnNames: "mensagem_id", baseTableName: "regra_negocio_mensagem", constraintName: "FK96274A3CF8BEAD38", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "mensagem", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-24") {
        addForeignKeyConstraint(baseColumnNames: "regra_negocio_mensagens_id", baseTableName: "regra_negocio_mensagem", constraintName: "FK96274A3CD51538C9", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "regra_negocio", referencesUniqueColumn: "false")
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-32") {
        createIndex(indexName: "caso_de_uso_id_unique_1401133161780", tableName: "fluxo_basico", unique: "true") {
            column(name: "caso_de_uso_id")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-35") {
        createIndex(indexName: "codigo_unique_1401133161786", tableName: "mensagem", unique: "true") {
            column(name: "codigo")
        }
    }

    changeSet(author: "emilio.carmo (generated)", id: "1401133161839-37") {
        createIndex(indexName: "codigo_unique_1401133161787", tableName: "regra_negocio", unique: "true") {
            column(name: "codigo")
        }
    }
}
