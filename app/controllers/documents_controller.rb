class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end
  
  def index
    @documents = Document.all
  end

  def create
     @document = Document.create(params[:document])
     @document.save     
  end
  
  def destroy
    @document = Document.find(params[:id]).destroy
    flash[:success] = "Document deleted"
    redirect_to(:back)
  end

end