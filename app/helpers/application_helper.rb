module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ask Me").join(" - ")
      end
    end
  end
end
