using Plots

function generate_plot(bubblesort_time, heapsort_time, array_size)
    p = plot(
        bubblesort_time, array_size, 
        label = "BubbleSort", 
        xlabel = "Time (seconds)", 
        ylabel = "Array Size", 
        lw = 2, 
        #xscale = :log10, 
        #yscale = :log10,
        legend=:topleft,
        title = "BubbleSort vs HeapSort",
        linecolor = :blue
    )
    
    plot!(
        heapsort_time, array_size,
        label = "HeapSort", 
        lw = 2,
        linecolor = :red  # Distinguindo as cores
    )

    display(p)
    #savefig(p, ".")
end
