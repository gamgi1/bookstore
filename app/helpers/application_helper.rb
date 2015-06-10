module ApplicationHelper
  def administrator_signed_in?
    current_administrator.present?
  end
  def danger_none_left(stock)
    if stock <= 0
      return "danger"
    end
  end
end
