RailsAdmin.config do |config|
  config.main_app_name = ["AWS Lille", "BackOffice"]

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :author
  end
  config.current_user_method(&:current_author)

  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end

  config.model 'Author' do
    object_label_method do
      :custom_label_method
    end
  end
end

