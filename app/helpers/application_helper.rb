module ApplicationHelper
  def administrator_signed_in?
    current_administrator.present?
  end
end
