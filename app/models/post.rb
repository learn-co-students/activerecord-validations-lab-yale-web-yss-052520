class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait?

    def clickbait?
        patterns = [
            /Won't Believe/,
            /Secret/,
            /Top [0-9]*/,
            /Guess/
        ]

        if patterns.none? { |pat| pat.match title }
            errors.add(:title, "must be clickbait")
        end
    end
end
