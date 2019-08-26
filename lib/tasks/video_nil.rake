namespace :video_position do
  desc "Add default position to any nil video positions"

  task :add_video_position => :environment do
    Video.where(position: Nil).each do |t|
      t.update_attribute :position, 0
    end
  end
end
