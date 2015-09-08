RailsAdmin.config do |config|
  config.actions do
    import do
      only :Question
    end
  end

  # Optional:
  # Configure global RailsAdminImport options
  config.configure_with(:import) do |config|
    config.logging = true
    config.rollback_on_error = true
  end

  # Optional:
  # Configure model-specific options using standard RailsAdmin DSL
  # See https://github.com/sferik/rails_admin/wiki/Railsadmin-DSL
  config.model "Question" do
    import do
      field :content
      field :question_type
      field :state
      field :subject
      field :user
      configure :exam do
        hide
        # for list view
        filterable false
        searchable false
      end

    end
  end
end
