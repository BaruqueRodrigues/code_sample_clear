
<!-- README.md is generated from README.Rmd. Please edit that file -->

# code.sample.clear

<!-- badges: start -->
<!-- badges: end -->

O pacote code.sample.clear tem como objetivo apresentar um code sample
para a Seleção Chamada 07/2023 FGV EESP CLEAR, apresentando o code
sample e sumarizando em formato de pacote o código encapsulado, seguindo
as melhores normas de reprodutibilidade, manutenção e escalamento de
scripts em R

## Instalação

A instalação é feita através do repositório do github

``` r
devtools::install_github("BaruqueRodrigues/code_sample_clear")
```

## Exemplo

Workflow básico de funcionamento do pacote é dado através da raspagem da
api do site <https://formosodoaraguaia.megasofttransparencia.com.br/>,
onde nos conectamos a api do site e fazemos todas as requisições pelo
ambiente do R.

Para executar a raspagem criamos 2 funções, a primeira que pega as
informações dos empenhos, e a segunda que pega o detalhamento dos
empenhos. A execução do pacote é bem simples, primeiro é executada a
função pega_empenhos()

``` r
code.sample.clear::pega_empenhos()
#> # A tibble: 11,004 × 11
#>    codigo numeroDoTcm data       nomeDoFornecedor         classificacaoOrcamen…¹
#>     <int>       <int> <chr>      <chr>                    <chr>                 
#>  1  17219   202317219 26/05/2023 L.P. SIQUEIRA            05.13.08.244.10316.2.…
#>  2  17235   202317235 25/05/2023 ASSOC. APOIO CENTRO M.E… 08.16.12.361.10323.2.…
#>  3  17246   202317246 25/05/2023 P R COELHO ALIMENTOS LT… 04.12.10.301.10315.2.…
#>  4  17236   202317236 25/05/2023 ASSOC.APOIO A ESC.M. SI… 08.16.12.361.10323.2.…
#>  5  17231   202317231 25/05/2023 SECRETARIA DA FAZENDA    03.09.15.451.10312.2.…
#>  6  17243   202317243 25/05/2023 ASSOC. APOIO A ESC.N.PR… 08.16.12.361.10323.2.…
#>  7  17232   202317232 25/05/2023 ASSOC.APOIO A ESC.MUNIC… 08.16.12.361.10323.2.…
#>  8  17233   202317233 25/05/2023 ASSOC.APOIO A ESC.MUNIC… 08.16.12.361.10323.2.…
#>  9  17234   202317234 25/05/2023 ASSOC. APOIO CENTRO M.E… 08.16.12.361.10323.2.…
#> 10  17241   202317241 25/05/2023 ASSOC.APOIO A ESC.M.HER… 08.16.12.361.10323.2.…
#> # ℹ 10,994 more rows
#> # ℹ abbreviated name: ¹​classificacaoOrcamentaria
#> # ℹ 6 more variables: valorDoEmpenho <dbl>, valorDaAnulacaoDoEmpenho <dbl>,
#> #   valorDaLiquidacao <dbl>, valorDaAnulacaoDaLiquidacao <dbl>,
#> #   valorDoPagamento <dbl>, valorAnulacaoDoPagamento <dbl>
```


Também disponibilizamos os dados no pacote em formato .rds que pode ser
acessado através do código

``` r
code.sample.clear::df_empenhos
#> # A tibble: 11,004 × 11
#>    codigo numeroDoTcm data       nomeDoFornecedor         classificacaoOrcamen…¹
#>     <int>       <int> <chr>      <chr>                    <chr>                 
#>  1  17219   202317219 26/05/2023 L.P. SIQUEIRA            05.13.08.244.10316.2.…
#>  2  17235   202317235 25/05/2023 ASSOC. APOIO CENTRO M.E… 08.16.12.361.10323.2.…
#>  3  17246   202317246 25/05/2023 P R COELHO ALIMENTOS LT… 04.12.10.301.10315.2.…
#>  4  17236   202317236 25/05/2023 ASSOC.APOIO A ESC.M. SI… 08.16.12.361.10323.2.…
#>  5  17231   202317231 25/05/2023 SECRETARIA DA FAZENDA    03.09.15.451.10312.2.…
#>  6  17243   202317243 25/05/2023 ASSOC. APOIO A ESC.N.PR… 08.16.12.361.10323.2.…
#>  7  17232   202317232 25/05/2023 ASSOC.APOIO A ESC.MUNIC… 08.16.12.361.10323.2.…
#>  8  17233   202317233 25/05/2023 ASSOC.APOIO A ESC.MUNIC… 08.16.12.361.10323.2.…
#>  9  17234   202317234 25/05/2023 ASSOC. APOIO CENTRO M.E… 08.16.12.361.10323.2.…
#> 10  17241   202317241 25/05/2023 ASSOC.APOIO A ESC.M.HER… 08.16.12.361.10323.2.…
#> # ℹ 10,994 more rows
#> # ℹ abbreviated name: ¹​classificacaoOrcamentaria
#> # ℹ 6 more variables: valorDoEmpenho <dbl>, valorDaAnulacaoDoEmpenho <dbl>,
#> #   valorDaLiquidacao <dbl>, valorDaAnulacaoDaLiquidacao <dbl>,
#> #   valorDoPagamento <dbl>, valorAnulacaoDoPagamento <dbl>
```

A partir do dataset acima utilizamos a coluna código para acessar os
detalhes dentro da api do site
<https://formosodoaraguaia.megasofttransparencia.com.br/>.

``` r
code.sample.clear::pega_detalhes_processo(
  chave_primaria = code.sample.clear::df_empenhos$codigo[1])
#> # A tibble: 3 × 41
#>   codigo numeroDoTcm data       classificacaoOrcamentaria   valorDoEmpenho
#>    <int>       <int> <chr>      <chr>                                <dbl>
#> 1  17219   202317219 26/05/2023 05.13.08.244.10316.2.339030          2335.
#> 2  17219   202317219 26/05/2023 05.13.08.244.10316.2.339030          2335.
#> 3  17219   202317219 26/05/2023 05.13.08.244.10316.2.339030          2335.
#> # ℹ 36 more variables: valorDaAnulacaoDoEmpenho <int>, valorDaLiquidacao <dbl>,
#> #   valorDaAnulacaoDaLiquidacao <int>, tituloDaFonte <chr>,
#> #   cnpjENomeDoFornecedor <chr>, codigoENomeDoOrgao <chr>,
#> #   codigoENomeDaUnidade <chr>, codigoENomeDaFuncao <chr>,
#> #   codigoENomeDaSubfuncao <chr>, codigoENomeDoProgarama <chr>,
#> #   codigoENomeDaAcao <chr>, codigoENomeDaNaturezaDespesa <chr>,
#> #   valorTotalDoEmpenho <dbl>, valorTotalDaLiquidacao <dbl>, …
```

Para raspar todos os códigos utilizamos um a função map. Apresentaremos
aqui uma versão resumida, onde apresentaremos os 10 primeiros códigos de
processo, caso deseje os detalhes de todos os empenhos, suprima os
colchetes. Utilizamos um intervalo de .2 segundos entre cada requisição
para evitar bloqueios pelos multiplos acessos.

``` r
 
purrr::map_dfr(code.sample.clear::df_empenhos$codigo[1:5],
               ~ {
                 Sys.sleep(.2)
                 code.sample.clear::pega_detalhes_processo(.x)
                 
                 
               })
#> # A tibble: 15 × 41
#>    codigo numeroDoTcm data       classificacaoOrcamentaria   valorDoEmpenho
#>     <int>       <int> <chr>      <chr>                                <dbl>
#>  1  17219   202317219 26/05/2023 05.13.08.244.10316.2.339030         2335. 
#>  2  17219   202317219 26/05/2023 05.13.08.244.10316.2.339030         2335. 
#>  3  17219   202317219 26/05/2023 05.13.08.244.10316.2.339030         2335. 
#>  4  17235   202317235 25/05/2023 08.16.12.361.10323.2.335041         4000  
#>  5  17235   202317235 25/05/2023 08.16.12.361.10323.2.335041         4000  
#>  6  17235   202317235 25/05/2023 08.16.12.361.10323.2.335041         4000  
#>  7  17246   202317246 25/05/2023 04.12.10.301.10315.2.339030          332. 
#>  8  17246   202317246 25/05/2023 04.12.10.301.10315.2.339030          332. 
#>  9  17246   202317246 25/05/2023 04.12.10.301.10315.2.339030          332. 
#> 10  17236   202317236 25/05/2023 08.16.12.361.10323.2.335041         4000  
#> 11  17236   202317236 25/05/2023 08.16.12.361.10323.2.335041         4000  
#> 12  17236   202317236 25/05/2023 08.16.12.361.10323.2.335041         4000  
#> 13  17231   202317231 25/05/2023 03.09.15.451.10312.2.339047           72.1
#> 14  17231   202317231 25/05/2023 03.09.15.451.10312.2.339047           72.1
#> 15  17231   202317231 25/05/2023 03.09.15.451.10312.2.339047           72.1
#> # ℹ 36 more variables: valorDaAnulacaoDoEmpenho <int>, valorDaLiquidacao <dbl>,
#> #   valorDaAnulacaoDaLiquidacao <int>, tituloDaFonte <chr>,
#> #   cnpjENomeDoFornecedor <chr>, codigoENomeDoOrgao <chr>,
#> #   codigoENomeDaUnidade <chr>, codigoENomeDaFuncao <chr>,
#> #   codigoENomeDaSubfuncao <chr>, codigoENomeDoProgarama <chr>,
#> #   codigoENomeDaAcao <chr>, codigoENomeDaNaturezaDespesa <chr>,
#> #   valorTotalDoEmpenho <dbl>, valorTotalDaLiquidacao <dbl>, …
```
