class CategoryController < ApplicationController
    def new
        @category = Category.new
        authorize @category
    end
    def create
        @category = Category.new(category_params)
        authorize @category
        if @category.save
            redirect_to @category, notice: "Category was successfully created."
          else
            render :new, status: :unprocessable_entity
          end
    end

    private 
    def category_params
        params.require(:category).permit(:category_name)
    end
end
