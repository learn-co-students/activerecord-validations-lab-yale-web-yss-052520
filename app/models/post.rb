class Post < ActiveRecord::Base

    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Ficton"]}
    validate :is_title_clickbait?

    # Using Regex!! Regular expressions
    #/i gets rid of case sensitivity
    CLICKBAIT = [
        /Won't Believe/i, 
        /Secret/i, 
        /Guess/i, 
        /Number [0-9]/i
    ]
    
    def is_title_clickbait?
        # we need to check whether our clickbait patterns are matched or not
        # Going to use the .none? enumerable.
        # Use regex instance method .match to see if a pattern matches iwth a string
        if CLICKBAIT.none? {|bait| bait.match(title)}
            errors.add(:title, "must be clickbait")
        end 
    end 
end
