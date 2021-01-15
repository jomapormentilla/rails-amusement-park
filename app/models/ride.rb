class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if !enough_tickets? && !tall_enough?
            "Sorry. You do not have enough tickets to ride the #{ attraction.name }. You are not tall enough to ride the #{ attraction.name }."
        elsif !enough_tickets?
            "Sorry. You do not have enough tickets to ride the #{ attraction.name }."
        elsif !tall_enough?
            "Sorry. You are not tall enough to ride the #{ attraction.name }."
        else
            new_balance
            new_mood
            "Thanks for riding the #{ attraction.name }!"
        end
    end

    def enough_tickets?
        user.tickets > attraction.tickets
    end

    def tall_enough?
        user.height > attraction.min_height
    end

    def new_balance
        user.update(tickets: user.tickets - attraction.tickets)
    end

    def new_mood
        user.update(nausea: user.nausea + attraction.nausea_rating)
        user.update(happiness: user.happiness + attraction.happiness_rating)
    end
end
