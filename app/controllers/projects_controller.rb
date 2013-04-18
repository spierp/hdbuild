class ProjectsController < ApplicationController
  
  def new
    if user_signed_in?
    @project = Project.new
    @users = User.order_by('first_name ASC').collect {|x| [x.combined_name, x.id] }
    else
    redirect_to root_path
    end
  end
  
  def index
    if user_signed_in?
      @projects = Project.all
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
  
  def show
    @project = Project.find(params[:id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
    
#  def add_documents
#    @project = Project.find(params[:id])
#    @documents = Document.new     
#  end
  
#  def zip_documents
#      @bid = Bid.find_by_privatelink!(params[:id])
#      if @bid.documents.map(&:file_size).inject(:+).to_s == @bid.doc_package_size
#        redirect_to @bid, :notice => "Zip generated!"
#      else 
#      if @bid.documents.map(&:file_size).inject(:+).to_f < 2.621e+8   
#      Resque.enqueue(DocumentZipper, @bid.id)
#      end
#      redirect_to @bid, :notice => "Zip generating!"
#    end

#  end  
  
#  def add_photos
#    @bid = Bid.find_by_privatelink!(params[:id])
#    @photos = Photo.new     
#  end
  
#  def add_notice
#    @bid = Bid.find_by_privatelink!(params[:id])
#    @notice = Notice.new    
# end
  
  def create
    @project = current_user.projects.build(params[:project])
    if @bid.save
      flash[:success] = "Project Created! Now Add Documents"
      redirect_to @project
    else    
      render 'new'
    end
  end

  def edit
#    if current_user 
        @project = Project.find(params[:id])
        @users = User.order_by('first_name ASC').collect {|x| [x.combined_name, x.id] }
#    else
#      redirect_to @bid
#    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:success] = "Project Updated"
      redirect_to @project
    else  
      render 'edit'
    end  
  end

  def destroy
    @project = Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to projects_path
  end
  

  
end