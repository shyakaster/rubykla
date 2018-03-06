module Blog
  class PagesController < ApplicationController
  def show
    render template: "blog/pages/#{params[:page]}"
  end
end

end
