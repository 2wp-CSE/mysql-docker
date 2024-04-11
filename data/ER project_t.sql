/* Tables */
CREATE TABLE PILOTA (
    id INTEGER NOT NULL,
    Nome INTEGER NOT NULL,
    Cognome INTEGER NOT NULL,
    foto INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE SETUP (
    n_telaio INTEGER NOT NULL,
    rear_suspension INTEGER NOT NULL,
    front_suspension INTEGER NOT NULL,
    gomme INTEGER NOT NULL,
    motore INTEGER NOT NULL,
    PRIMARY KEY (n_telaio)
);
CREATE TABLE SESSIONE (
    titolo VARCHAR(64) NOT NULL,
    round INTEGER NOT NULL,
    data INTEGER NOT NULL,
    circuito VARCHAR(32) NOT NULL,
    type VARCHAR(32) NOT NULL,
    team VARCHAR(32) NOT NULL,
    sessione INTEGER NOT NULL,
    PILOTA_id INTEGER NOT NULL,
    SETUP_n_telaio INTEGER NOT NULL,
    PRIMARY KEY (titolo),
    FOREIGN KEY (PILOTA_id) REFERENCES PILOTA(id),
    FOREIGN KEY (SETUP_n_telaio) REFERENCES SETUP(n_telaio)
);
CREATE TABLE METEO (
    SESSIONE_titolo VARCHAR(64) NOT NULL,
    pressione_atm_mbar INTEGER NOT NULL,
    temp_aria INTEGER NOT NULL,
    hum INTEGER NOT NULL,
    condizione INTEGER NOT NULL,
    temp_asfalto INTEGER NOT NULL,
    vento_kmh INTEGER NOT NULL,
    vento_direzione INTEGER NOT NULL,
    PRIMARY KEY (SESSIONE_titolo),
    FOREIGN KEY (SESSIONE_titolo) REFERENCES SESSIONE(titolo)
);
CREATE TABLE RISULTATI (
    SESSIONE_titolo VARCHAR(64) NOT NULL,
    ID INTEGER NOT NULL,
    n_lap INTEGER NOT NULL,
    km_percorsi INTEGER NOT NULL,
    v_max_kmh INTEGER NOT NULL,
    durata_sessione_s INTEGER NOT NULL,
    rpm_a_vmax INTEGER NOT NULL,
    best_lap_s INTEGER NOT NULL,
    v_max_best_lap INTEGER NOT NULL,
    t_aria_media INTEGER NOT NULL,
    lambda_wot INTEGER NOT NULL,
    front_susp_max INTEGER NOT NULL,
    rear_susp_max INTEGER NOT NULL,
    secondi_fuorigiri INTEGER NOT NULL,
    rpm_max INTEGER NOT NULL,
    t_max_liquido INTEGER NOT NULL,
    t_min_liquido INTEGER NOT NULL,
    t_avg_liquido INTEGER NOT NULL,
    PRIMARY KEY (SESSIONE_titolo, ID),
    FOREIGN KEY (SESSIONE_titolo) REFERENCES SESSIONE(titolo)
);
CREATE TABLE CHECKOUT (
    SESSIONE_titolo VARCHAR(64) NOT NULL,
    code INTEGER NOT NULL,
    temp_h20 INTEGER NOT NULL,
    press_post_caldo INTEGER NOT NULL,
    press_ant_caldo INTEGER NOT NULL,
    termocoperte_1h INTEGER NOT NULL,
    nastri_radiatore INTEGER NOT NULL,
    livello_olio INTEGER NOT NULL,
    benzina_lt INTEGER NOT NULL,
    pagina_cruscotto INTEGER NOT NULL,
    sticker_lato_freno INTEGER NOT NULL,
    luce_posteriore INTEGER NOT NULL,
    PRIMARY KEY (SESSIONE_titolo, code),
    FOREIGN KEY (SESSIONE_titolo) REFERENCES SESSIONE(titolo)
);
CREATE TABLE CHECKIN (
    SESSIONE_titolo VARCHAR(64) NOT NULL,
    code INTEGER NOT NULL,
    press_post_caldo INTEGER NOT NULL,
    press_ant_caldo INTEGER NOT NULL,
    termocoperte_1h INTEGER NOT NULL,
    nastri_radiatore INTEGER NOT NULL,
    livello_olio INTEGER NOT NULL,
    benzina_lt INTEGER NOT NULL,
    pagina_cruscotto INTEGER NOT NULL,
    sticker_lato_freno INTEGER NOT NULL,
    luce_posteriore INTEGER NOT NULL,
    PRIMARY KEY (SESSIONE_titolo, code),
    FOREIGN KEY (SESSIONE_titolo) REFERENCES SESSIONE(titolo)
);