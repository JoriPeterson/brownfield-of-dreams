class TutorialsController < ApplicationController

	def index
		if current_user
			@tutorials = Tutorial.all
		else
			@tutorials = Tutorial.where("classroom = ?", "false")
		end
	end

  def show
    tutorial = Tutorial.find(params[:id])
    @facade = TutorialFacade.new(tutorial, params[:video_id])
  end
end
