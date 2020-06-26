class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-fiction"]}
  validate :is_clickbait

  def is_clickbait
    if title
      if title.exclude?("Guess") && title.exclude?("Won't Believe") && title.exclude?("Top") && title.exclude?("Secret")
        errors.add(:title, "Not clickbaity enough")
      end
    end
  end

end
