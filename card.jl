mutable struct Card
    m_rank::String
    m_suit::String
    m_value::Int32
    m_count::Int32
    m_is_ace::Bool
    m_face_down::Bool

    print::Function

    function Card(rank::String, suit::String)
        this = new()
        this.m_rank = rank
        this.m_suit = suit
        this.m_value = evaluate(rank)
        this.m_count = count_card(rank)
        this.m_is_ace = rank == "A"
        this.m_face_down = false

        this.print = function ()
            return this.m_face_down ? "X" : this.m_rank
        end

        return this
    end
end


function evaluate(val::String)
    if val == "J" || val == "Q" || val == "K"
        return 10
    end
    if val == "A"
        return 11
    end
    return parse(Int32, val)

end

function count_card(val::String)
    if val == "10" || val == "J" || val == "Q" || val == "K" || val =="A"
        return -1
    end
    if val == "7" || val == "8" || val == "9"
        return 0
    end
    return 1
end