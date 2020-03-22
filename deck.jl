include("./card.jl")

ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
suits = ["Clubs", "Hearts", "Spades", "Diamonds"]

mutable struct Deck
    m_cards::Array{Card}

    function Deck()
        this = new()
        this.m_cards = Card[]
        for suit in suits
            for rank in ranks
                push!(this.m_cards, Card(rank, suit))
            end
        end

        return this
    end
end