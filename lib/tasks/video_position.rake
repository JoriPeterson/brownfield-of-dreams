namespace :video_position do
  desc "Add default position to any nil video positions"

  task :remove_nil => :environment do
    Video.where(position: nil).each do |t|
      t.update_attribute :position, 0
    end
  end
end
