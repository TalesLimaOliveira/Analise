using Plots

function generate_plot(insertionsort_time, heapsort_time, array_size)
    p = plot(
        title = "InsertionSort vs HeapSort",
        xlabel = "Array Size", 
        ylabel = "Time (seconds)", 
        xscale = :log10, 
        yscale = :log10,
        legend=:topleft,
    )

    plot!(
        p,
        array_size, insertionsort_time,
        label = "InsertionSort",
        lw = 2,
        linecolor = :blue  # Distinguindo as cores
    )

    
    plot!(
        p,
        array_size, heapsort_time,
        label = "HeapSort", 
        lw = 2,
        linecolor = :red  # Distinguindo as cores
    )

    display(p)
    savefig(p, "Projeto 2/imgs/plot2.png")
end
