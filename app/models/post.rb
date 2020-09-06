class Post < ApplicationRecord

    has_many :post_categories
    has_many :categories, through: :post_categories
    has_many :comments
    has_many :users, through: :comments

    def self.search(query)
        if query.present?
            self.where("title LIKE ?", "%#{query}%")
        else
            self.all
        end
    end

    def self.filter(category_id)
        if category_id.present?
            self.joins(:post_categories).where("post_categories.category_id = ?", "#{category_id}")
        else
            self.all
        end
    end

    def categories_attributes=(categories_attributes)
        categories_attributes.values.each do |category_attributes|
            if category_attributes[:name].present?
                # self.categories.build(category_attributes) # doesn't check if category already exists
                category = Category.find_or_create_by(category_attributes)
                # self.post_categories.build(category: category) # better so it doesn't return all categories like push does
                self.categories << category unless self.categories.include?(category)
            end
        end
    end
    
end
