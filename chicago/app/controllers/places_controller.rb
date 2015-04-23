#patricia corvino
class PlacesController < ApplicationController

  def index
    @places = Place.all.limit(100)
  end
 
  def show  
   @p= Place.find_by(:id => params["id"]) 
   @tempreviews= Review.where(placeid: params["id"])
   @reviews = @tempreviews.sort_by{|review| review[:placeid]}.reverse
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
    @photo = params[:newphoto]
    @admission=params[:newprice] 
    @description = params[:newdescription]
    Place.create(title: @inserttitle, photo: @photo, admission: @admission, description: @description)
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
    num = @update_place.id
    redirect_to "/places/#{num}"
  end

  def addreview
    @rating = params[:rating]
    @short_title = params[:short_title]
    @placeid = params[:id]
    Review.create(rating: @rating, short_title: @short_title, placeid: @placeid)
    redirect_to "/places/#{@placeid}"
  end



end
