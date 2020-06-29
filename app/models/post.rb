class Post < ActiveRecord::Base
    validate :is_clickbait

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    def is_clickbait
        if title
            unless title.match(/Won't Believe/) || title.match(/Secret/) || title.match(/Top +[0-9]/) || title.match(/Guess/)
                errors.add(:title, "not sufficiently clickbait-y")
            end
        end
    end
end
