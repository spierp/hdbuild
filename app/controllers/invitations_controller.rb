class InvitationsController < Devise::InvitationsController
  # GET /resource/invitation/new
    def new
      build_resource
      1.times { resource.memberships.new }
      @projects = current_user.projects.order_by('updated_at DESC').collect {|x| [x.name, x.id] }
      render :new
    end
    
end