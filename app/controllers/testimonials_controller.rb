class TestimonialsController < ApplicationController
  layout 'application'
  before_action :redirect_to_home_without_session

  def index
    # is_csv = params[:format] && params[:format] == "csv"
    @testimonials = Testimonial.includes(:account).where("id > 0").order('created_at desc').paginate(page: params[:page], per_page: 10000)

    respond_to do |format|
      format.csv if @session_user.admin?
    end
  end
end