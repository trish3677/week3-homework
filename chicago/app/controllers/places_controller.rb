class PlacesController < ApplicationController

  def index
    @places = Place.all.limit(100)
  end
 
  def show  
   @p= Place.find_by(:id => params["id"]) 
    if @p != nil
      @title = @p.title
      @photo = @p.photo
      @admission = @p.admission
      @description = @p.description
      @id = @p.id
    else
      redirect_to "/places", notice: "Place not found."
    end
  end

  def delete  
   @p= Place.find_by(:id => params["id"]) 
    if @p != nil
      @p.delete
      redirect_to "/places"
    else
      redirect_to "/places", notice: "Place not found."
    end
  end

  def new
  end

  def create
    @inserttitle = params[:newtitle]
    Place.create(title: @inserttitle)
    redirect_to "/places"
  end

  def edit
    @p= Place.find_by(:id => params["id"]) 
    if @p != nil
      @title = @p.title
      @photo = @p.photo
      @admission = @p.admission
      @description = @p.description
      @id = @p.id
    else
      redirect_to "/places", notice: "Place not found."
    end
  end

  def update
    @update_place = Place.find_by(:title => params["updatetitle"])
    @update_place.photo = params[:updatephoto]
    @update_place.admission = params[:updateprice]
    @update_place.description = params[:updatedescription]
    @update_place.save
    redirect_to "/places/:id"
  end


end
