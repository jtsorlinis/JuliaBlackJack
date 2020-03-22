include("./card.jl")
include("./deck.jl")

using Random

mutable struct CardPile
    m_cards::Array{Card}
    m_original_cards::Array{Card}
    
    print::Function
    refresh::Function
    shuffle::Function
    
    function CardPile(numdecks::Int)
        this = new()
        this.m_cards = []
        for i = 1:numdecks
            append!(this.m_cards, Deck().m_cards)
        end
        this.m_original_cards = copy(this.m_cards)

        function xorshift() 
            return 5
        end

        this.print = function ()
            output = ""
            for card in this.m_cards
                output *= card.print()
            end
            return output
        end

        this.shuffle = function ()
            shuffle!(this.m_cards)
        end

        this.refresh = function ()
            this.m_cards = copy(this.m_original_cards)
        end

        return this
    end
end