class PostValidator < ActiveModel::Validator
    def validate(record)
        if !record.title
            record.errors[:title] << "Title Missing"
        end
        
        unless record.title.to_s.include?("Won't Believe" || "Secret" || "Top [number]" ||"Guess")
            record.errors[:title] << "Title is not sufficiently clickbait-y"
        end
        
    end
end