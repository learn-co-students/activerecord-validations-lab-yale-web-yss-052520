# require 'byebug'

class ClickBaitValidator < ActiveModel::Validator
    def validate(record)
        binding.pry
        unless !!record.title && record.title.match?(/Won't Believe|Secret|Top \d+|Guess/)
            record.errors[:title] << "Title must be Click-bait!"
        end
    end
end