class ProjectsController < ApplicationController
  
  def new
    if user_signed_in?
    @project = Project.new
    1.times { @project.memberships.build }     
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
    @project = Project.find_by_slug!(params[:id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @schedule_docs = @project.documents.where("document_category = 'schedule'")
    @model_docs = @project.documents.where("document_category = 'model'")    
    @drawings_docs = @project.documents.where("document_category = 'drawings'")     
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
    @project = Project.create(params[:project])
    if @project.save
      flash[:success] = "Project Created!"
      redirect_to @project
    else    
      render 'new'
    end
  end

  def edit
#    if current_user 
        @project = Project.find_by_slug!(params[:id])
        @users = User.order_by('first_name ASC').collect {|x| [x.combined_name, x.id] }
#    else
#      redirect_to @bid
#    end
  end

  def update
    @project = Project.find_by_slug!(params[:id])
    if @project.update_attributes(params[:project])
      flash[:success] = "Project Updated"
      redirect_to @project
    else  
      render 'edit'
    end  
  end

  def destroy
    @project = Project.find_by_slug!(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to projects_path
  end

  def reset_privatelink
    @project = Project.find_by_slug!(params[:id])
    @project.privatelink = SecureRandom.urlsafe_base64(n = 3)
    @project.update_attributes(params[:project])
      flash[:success] = "Privatelink Reset"
      redirect_to @project
  end

  def edit_directory
    @project = Project.find_by_slug!(params[:id])
    @outsideusers = User.where("domain != 'hdcco'")
    @membership = Membership.new   
  end
    
  def edit_schedule
    @project = Project.find_by_slug!(params[:id])
    @documents = Document.new
    @schedule_docs = @project.documents.where("document_category = 'schedule'")   
  end

  def edit_model
    @project = Project.find_by_slug!(params[:id])
    @model_docs = @project.documents.where("document_category = 'model'")        
  end
    
  def edit_drawings
    @project = Project.find_by_slug!(params[:id])
    @drawings_docs = @project.documents.where("document_category = 'drawings'")       
  end

  def edit_site
    @project = Project.find_by_slug!(params[:id])
    @site_docs = @project.documents.where("document_category = 'site'")        
  end

  def edit_estimate
    @project = Project.find_by_slug!(params[:id])
    @estimate_docs = @project.documents.where("document_category = 'estimate'")      
  end

  def edit_procurement
    @project = Project.find_by_slug!(params[:id])
  end

  def edit_submittals
    @project = Project.find_by_slug!(params[:id])
  end

  def edit_rfis
    @project = Project.find_by_slug!(params[:id])
  end  
  
  def edit_pcos
    @project = Project.find_by_slug!(params[:id])
  end  
            
end