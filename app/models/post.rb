class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

    #Custom validator
    validate :clickbaity_title

    def clickbaity_title
        if !(["Won't Believe","Secret","Top [number]","Guess"].any?{|phrase|"#{title}".include?(phrase)})
            errors.add(:title, "not clickbait")
        end
    end
end
