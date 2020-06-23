class Post < ActiveRecord::Base
    
    validates :title, presence: true 
    validates :content, length: {minimum: 250} 
    validates :summary, length: {maximum: 250} 
    validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
    validate :is_clickbaity 

    def is_clickbaity 
        array = ["Won't Believe", "Secret", "Guess"] 
        unless self.title == nil
            array.each do |clickbait_word| 
                if self.title.include?(clickbait_word) 
                    return true 
                end 
            end 
            if self.title.match(/Top [0-9]/i) 
                return true 
            end 
            errors.add(:title, "Not Clickbait!")
        end 
    end 

end
