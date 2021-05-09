# name: evidence-uploader
# version: 0.7.0

enabled_site_setting :evidence_uploader_enabled

after_initialize do
  load File.expand_path('../app/controllers/evidence_uploader_controller.rb', __FILE__)
  load File.expand_path('../app/controllers/evidences_controller.rb', __FILE__)

  Discourse::Application.routes.append do
    %w{users u}.each_with_index do |root_path, index|
      get "#{root_path}/:username/preferences/evidence_uploader" => 'evidence_uploader#index'
      get "#{root_path}/:username/preferences/evidence_uploader" => 'evidence_uploader#index'
    end
    post '/evidences' => 'evidences#update'
  end
end
