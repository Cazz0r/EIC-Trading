class Api::V1::TestimonialsController < Api::V1::BaseController
  before_action :load_testimonial, only: [:show, :update, :destroy]
  skip_before_action :require_session, only: [:create]
  

  def index
    @testimonials = Testimonials.where('id > 0').order("created_at desc").limit(100)
    render_testimonials(200)
  end

  def show
    render_testimonial(200)
  end

  def create
  	return custom_error([:account_required]) if testimonial_params[:account_id].blank?
  	return custom_error([:order_required]) if testimonial_params[:order_id].blank?
  	return custom_error([:testimonial_required]) if testimonial_params[:content].blank?
    @testimonial = Testimonial.new(testimonial_params)
    return ar_error(@testimonial) unless @testimonial.save
    render_testimonial(201)
  end

  def update
    return ar_error(@testimonial) unless @testimonial.update_attributes(testimonial_params)
    render_testimonial(202)
  end

  def destroy
    @testimonial.destroy
    head :no_content
  end

  private
  def testimonial_params
    params.require(:testimonial).permit(:content, :account_id, :order_id)
  end

  def render_testimonials(status)
    outputs = [{ model: @testimonials, key: :testimonials, serializer: Api::V1::TestimonialSerializer }]
    render_json(status, outputs)
  end

  def render_testimonial(status)
    outputs = [{ model: @testimonial, key: :testimonial, serializer: Api::V1::TestimonialSerializer }]
    render_json(status, outputs)
  end
end