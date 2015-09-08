module RailsAdminImportQuestion
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :content
        field :subject
        field :user
        field :created_at
      end
    end
  end
end
