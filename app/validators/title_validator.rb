class TitleValidator < ActiveModel::Validator

    

    def validate(record)
        if record.title
            unless record.title.match?(/Won't Believe|Secret|Top|Guess/)
            record.errors[:title] << "Title is not sufficiently clickbait-y!"
            end
        else 
            record.errors[:title] << "Title is not sufficiently clickbait-y!"
        end
    end
end