
# Simple linear search function
function simple_search(vector, key)
    for i in 1:length(vector)
        if vector[i] == key
            return i  # Returns the index where the key was found
        end
    end
    return -1  # Returns -1 if the key is not found
end
a