class CampaigncommentsController < ApplicationController
  def create
    @comment = Campaigncomment.new(campaigncomment_params)
    @comment.campaign = Campaign.find(params[:campaign_id])
    @comment.user = current_user
    @campaign = @comment.campaign

    if @comment.save
      redirect_to @comment.campaign, notice: "Comment created"
    else
      redirect_to @campaign, alert: "Something went wrong, try again"
    end
  end

  def destroy
    @comment = Campaigncomment.find(params[:id])
    @campaign = @comment.campaign
    @comment.destroy
    redirect_to campaign_path(@campaign), status: :see_other
  end

  private

  def campaigncomment_params
    params.require(:campaigncomment).permit(:title)
  end
end
