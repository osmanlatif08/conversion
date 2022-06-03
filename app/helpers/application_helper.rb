module ApplicationHelper
    include Pagy::Frontend

    def pagy_page_entries_info(pagy, model: nil)
      model ||= 'item'
      "Displaying #{model.downcase.pluralize(pagy.count)} #{pagy.from} - #{pagy.to} of #{pagy.count} in total"
    end
end
