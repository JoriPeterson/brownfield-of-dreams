class Admin::TutorialsController < Admin::BaseController
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def create
    begin
      tutorial = Tutorial.create(tutorial_params)

      flash[:success] = "Successfully created tutorial."
      redirect_to tutorial_path(tutorial.id)
    rescue
      flash[:error] = "Unable to create tutorial."
     redirect_to new_admin_tutorial_path
    end

  end

  def new
    @tutorial = Tutorial.new
  end

  def update
    tutorial = Tutorial.find(params[:id])
    if tutorial.update(tutorial_params)
      flash[:success] = "#{tutorial.title} tagged!"
    end
    redirect_to edit_admin_tutorial_path(tutorial)
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:tag_list, :title, :description, :thumbnail)
  end
end
