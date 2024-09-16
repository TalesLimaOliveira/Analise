using Plots

# Função para gerar o gráfico de comparação
function gerar_grafico(tempos)
    # Gerar o gráfico
    abordagens = collect(keys(tempos))
    valores_tempo = collect(values(tempos))

    # Criar o gráfico de barras
    p = plot(
        abordagens, valores_tempo,
        xlabel = "Abordagem", 
        ylabel = "Tempo (segundos)", 
        title = "Comparação de Tempos de Execução", 
        legend = false,
    )

    display(p)
    savefig(p, "D:\\Files\\codes\\ifb_notes\\ifb_analise\\Projeto 3\\imgs\\comparacao_tempos.png")
end