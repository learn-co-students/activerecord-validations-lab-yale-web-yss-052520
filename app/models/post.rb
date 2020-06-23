class Post < ActiveRecord::Base
    
    validates :title, presence: true 
    validates :content, length: {minimum: 250} 
    validates :summary, length: {maximum: 250} 
    validates :category, inclusion: {in: %w{Fiction Non-Fiction}}
    validate :is_clickbaity 

    def is_clickbaity 
        array = ["Won't Believe", "Secret", "Top", "Guess"] 
        unless self.title == nil
            array.each do |clickbait_word| 
                if self.title.include?(clickbait_word) 
                    return true 
                end 
            end 
            errors.add(:title, "Not Clickbait!")
        end 
    end 

end
