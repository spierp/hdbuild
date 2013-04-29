class MembershipsController < ApplicationController
before_filter :authenticate_user!
  
  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.create(params[:membership])
    if @membership.save
    flash[:notice] = "Membership saved."  
    redirect_to :back
    else
      render 'new'
    end         
  end
    
  def destroy
    @membership = Membership.find(params[:id]).destroy
    flash[:notice] = "Membership removed."
    redirect_to :back
  end
  
  def update
    @membership = Membership.find(params[:id])
    if @membership.update_attributes(params[:membership])
      flash[:success] = "Membership Updated"
      redirect_to :back
    else  
      render :back
    end  
  end
  
end