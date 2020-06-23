class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if !record.title
            record.errors[:title] << "Missing Title"
            return
        end
        
        desired = ["Won't Believe", "Secret", "Top [number]","Guess"]
        unless desired.any? {|s| record.title.include?(s)}
            record.errors[:title] << "Missing Catchy Word"
        end
    end
end