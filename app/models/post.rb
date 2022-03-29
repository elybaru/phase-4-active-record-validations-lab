class Post < ApplicationRecord
    validates :title, presence: true
    validates :summary, length: { maximum: 250 }
    validates :content, length: { minimum: 250 }
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :disallow_clickbait
    
    def disallow_clickbait
        if title == "True Facts"
            errors.add(:title, "Clickbait is not permitted")
        end
    end
end
