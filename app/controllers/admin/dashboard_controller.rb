class Admin::DashboardController < Admin::BaseController
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end


=begin

Display a count of how many products are in the database
Display a count of how many categories are in the database

=end