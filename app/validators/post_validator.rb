class PostValidator < ActiveModel::Validator

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]

    def validate(record)
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match record.title }
            record.errors[:title]<<"must be clickbait"
        end
    end
end
