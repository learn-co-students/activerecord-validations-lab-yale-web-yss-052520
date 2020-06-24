class PostValidator < ActiveModel::Validator
    def validate(record)
      if record.title == nil  
        record.errors[:post] << "Please enter a title"
      elsif !record.title.match?(/Won't Believe|Secret|Guess|Top \d/)
        record.errors[:post] << "not clickbait-y enough"
      end
    end
  end