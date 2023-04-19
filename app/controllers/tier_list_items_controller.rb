class TierListItemsController < ApplicationController
  before_action :set_tier_list_item, only: %i[ show edit update destroy ]

  # GET /tier_list_items or /tier_list_items.json
  def index
    @tier_list_items = TierListItem.all
  end

  # GET /tier_list_items/1 or /tier_list_items/1.json
  def show
    @tier_list = TierList.find(params[:tier_list_id])
    @tier_list_item = TierListItem.find(params[:id])
  end
  

  # GET /tier_list_items/new
  def new
    @tier_list = TierList.find(params[:tier_list_id])
    @tier_list_item = @tier_list.tier_list_items.build  end

  # GET /tier_list_items/1/edit
  def edit
  end
  # POST /tier_list_items or /tier_list_items.json
  def create
    @tier_list = TierList.find(params[:tier_list_id])
    @tier_list_item = @tier_list.tier_list_items.build(tier_list_item_params)
  
    if @tier_list_item.save
      redirect_to tier_list_path(@tier_list), notice: 'Tier list item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tier_list_items/1 or /tier_list_items/1.json
  def update
    respond_to do |format|
      if @tier_list_item.update(tier_list_item_params)
        format.html { redirect_to tier_list_tier_list_item_path(@tier_list, @tier_list_item), notice: "Tier list item was successfully updated." }
        format.json { render :show, status: :ok, location: @tier_list_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tier_list_item.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /tier_list_items/1 or /tier_list_items/1.json
  def destroy
    @tier_list_item.destroy

    respond_to do |format|
      format.html { redirect_to tier_list_path(@tier_list), notice: 'Tier list item was successfully destroyed.' }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tier_list_item
      @tier_list = TierList.find(params[:tier_list_id])
      @tier_list_item = @tier_list.tier_list_items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tier_list_item_params
      params.require(:tier_list_item).permit(:name, :description, :tier, :justification, :tier_list_id)
    end
end
