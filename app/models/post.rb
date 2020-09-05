class Post < ApplicationRecord

    has_many :post_categories
    has_many :categories, through: :post_categories
    has_many :comments
    has_many :users, through: :comments

    def categories_attributes=(categories_attributes)
        categories_attributes.values.each do |category_attributes|
            if category_attributes[:name].present?
                #self.categories.build(category_attributes) # doesn't check if category already exists
                category = Category.find_or_create_by(category_attributes)
                self.categories << category 
            end
        end
    end
    
end
