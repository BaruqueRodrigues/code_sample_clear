#'  pega detalhes do empenho
#'
#' @param chave_primaria codigo do empenho adquirido atraves da funcao pega_empenhos()
#'
#' @return dataset com os detalhes do empenho
#' @export
#'
#' @examples
#'
#'
  pega_detalhes_processo <-function(chave_primaria){
    url <- "https://formosodoaraguaia.megasofttransparencia.com.br/api/receitas-e-despesas/empenho/detalhe"
    path <- ""
    query <- list(chavePrimaria = #"17219"
                    chave_primaria)

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

    response <-
      httr::GET(
        url = url,

        query = query,
        httr::add_headers(.headers = headers)
      )

    dataset <- httr::content(response) %>%
      tibble::enframe() %>%
      tidyr::pivot_wider(names_from = "name",
                         values_from = "value") %>%
      tidyr::unnest_longer(dplyr::everything())

    dataset
  }





