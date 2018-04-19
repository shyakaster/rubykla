module Blog
  class PagesController < ApplicationController
    def show
      @lead = Lead.new
      render template: "blog/pages/#{params[:page]}"
    end
    def create
        @lead = Lead.new lead_params
        if @lead.save
          cookies[:saved_lead] = true
           ApplicationMailer.welcome_email(@lead).deliver
          redirect_to root_path
        else
          redirect_to root_path, alert: 'Failed to save'
        end
    end

    private

    def lead_params
<<<<<<< HEAD
      params.require(:lead).permit(:email, :name)
=======
      params.require(:lead).permit(:email,:name)
>>>>>>> send_email_to_new_user
    end
  end

end
