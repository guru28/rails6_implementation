class NewslettersController < ApplicationController
	
  def index
    @newsletters = Newsletter.all
  end
 
  def show
    @newsletter = Newsletter.find(params[:id])
  end
 
  def new
    @newsletter = Newsletter.new
  end
 
  def edit
    @newsletter = Newsletter.find(params[:id])
  end
 
  def create
    @newsletter = Newsletter.new(newsletter_params)
 
    if @newsletter.save
      redirect_to @newsletter
    else
      render 'new'
    end
  end
 
  def update
    @newsletter = Newsletter.find(params[:id])
 
    if @newsletter.update(newsletter_params)
      redirect_to @newsletter
    else
      render 'edit'
    end
  end
 
  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
 
    redirect_to newsletters_path
  end

  def send_newsletter
    @newsletter = Newsletter.find(params[:id])
    Subcriber.all.each do |user|
      NewsletterMailer.newsletter_email(user, @newsletter).deliver_now
    end

    redirect_to newsletters_path
  end
 
  private
    def newsletter_params
      params.require(:newsletter).permit(:subject, :from_address, :content)
    end

end
