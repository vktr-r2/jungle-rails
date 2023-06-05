module ProductHelper
  def sold_out?(product)
    product.quantity <= 0
  end

  def display_sold_out(product)
    if sold_out?(product)
      content_tag(:span, "Sold Out", class: "badge soldout")
    end
  end
end
