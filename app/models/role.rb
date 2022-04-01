class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.pluck(:actor)
    end

    def locations
        self.auditions.pluck(:location)
    end

    def lead
        found = self.auditions.find_by(hired: true)
        return "no actor has been hired for this role" unless found
        found
    end

    def understudy
        second = self.auditions.where(role: true).second
        return "no actor has been hired for this role" unless second
        second
    end


end
