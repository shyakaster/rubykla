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
           # Contact.welcome_email(@lead).deliver
          redirect_to root_path
        else
          redirect_to root_path, notice: 'Failed to save, check that all fields are filled'
        end
    end

    private

    def lead_params
      params.require(:lead).permit(:email,:name)
    end
  end

end
