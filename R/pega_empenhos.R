#' pega empenhos
#'
#' @param url url da api do portal da transparencia a ser raspado
#'
#' @return dataset com as informacoes a serem raspadas
#' @export
#'
#' @examples
#'
pega_empenhos <- function(url = "https://formosodoaraguaia.megasofttransparencia.com.br/api/receitas-e-despesas/empenho/paginado"){
  url <- url
  path <- "/api/receitas-e-despesas/empenho/paginado"
  query <- list(
    codigoDoOrgao = "",
    codigoDaUnidade = "",
    dataInicial = "01/01/2019",
    codigoDaFuncao = "",
    codigoDaSubFuncao = "",
    codigoDoPrograma = "",
    codigoDoElemento = "",
    codigoDaModalidade = "",
    covid19 = "",
    fonteDoEmpenho = "",
    faseDoEmpenho = "4",
    etapaDaDespesa = "4",
    recaptcha = "03AL8dmw9oMTQJBiYGg4gOvyEAE-xGeyMgx4Lu2jHr-QWVmyFpFrsGxOl35HxNCd4kWXspjz85oaIuwWPBwP7DflbO-AS2nsqJgC6rkoL_Bh9OT9R2AgCo3fBR87WgV8CLM8PN7sTT78aGkb96mfN2tqhDxK9VvBbrJeDhY08Dsv5JYCH69mS4aFx__KJmjEG07ukXOMTldj8JtgqF42Mo4_nsEAL6XBDalPYL2bCXHwn2pKjm5Cy4EvA2mk1ks7EgCid4CIp6ocFxBQyIP4DWWWhVXcX2GDQJsALG794vjvleV5q-cZ-jivD9cWShVgx-jy1YrEi2fJQuNdY_OMSmOtLf1Wv0yrzUQK3Hb7fEPS2SiQWBNKlp3NZrtRm6uGvKhQbEo4Al7_vpUcLEprjThthxIt-X2t0E_pVUb_RI8T4jTFV4PABtWsrpc61oxDKUDNNQr3lYa6AlNM-4COLGq3xhicX4CDFItTc53U7ljbkk9DB6xUe-360oN38EDWH6tCsNkrQq6aMLuRCOceLAdTtt07TPxD_fq4-Kc2jWYkeCf4U1W2zbXC-mG_QtSywZNjsNzwtPvh1PlL_TIbJLVQLjmlgGahCCRo7OBrWvUzyweA28SHC1VAdxuNEhZQc4F8o8lddo25xL",
    pagina = "1",
    tamanhoDaPagina = "11100"
  )

  headers <- c(
    "accept" = "application/json, text/plain, */*",
    "accept-language" = "pt-BR,pt;q=0.9,en;q=0.8",
    "authorization" = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJtZWdhc29mdCIsInN1YiI6ImFwaSIsImV4cCI6MTY4NTU1OTc1NH0.cW5ykQ-Pmxi2OuXEpUhwyvPQxZxT2EZP6WTdVX8ibxakajd3yWL7_waFjO1nO3aW8zEZilZJn8TZwG1BM8OCLA",
    "cliente-integrado" = "megasoft-portal-da-transparencia",
    "referer" = "https://formosodoaraguaia.megasofttransparencia.com.br/receitas-e-despesas/empenho?faseDoEmpenho=4&etapaDaDespesa=4&dataInicial=01^%^2F01^%^2F2019",
    "sec-ch-ua" = "^\\^Google",
    "sec-ch-ua-mobile" = "?0",
    "sec-ch-ua-platform" = "^\\^Windows^^",
    "sec-fetch-dest" = "empty",
    "sec-fetch-mode" = "cors",
    "sec-fetch-site" = "same-origin",
    "user-agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36"
  )

  response <- httr::GET(url = url, query = query, httr::add_headers(.headers=headers))

  df_empenhos <- httr::content(response) %>%
    tibble::enframe() %>%
    dplyr::slice(2) %>%
    tidyr::pivot_wider(names_from = "name",
                       values_from = "value") %>%
    tidyr::unnest_longer(registros) %>%
    tidyr::unnest_wider(registros)

  df_empenhos
}


