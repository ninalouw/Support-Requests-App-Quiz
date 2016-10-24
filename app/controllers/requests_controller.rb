class RequestsController < ApplicationController

  def new
    @request = Request.new
 end

def create
  @request = Request.new(request_params)

if @request.save
   redirect_to request_path(@request)
 else
   render :new
end
end


def show
  @request = Request.find params[:id]
end

def index
  @request = Request.order(created_at: :desc)
  @requests = Request.order(:name).page params[:page]
  if params[:search]
  @requests = Request.search(params[:search]).order(created_at: :desc)
end

end

def edit
   @request = Request.find(params[:id])
end

def update
   @request = Request.find(params[:id])
   if @request.update(request_params)
     redirect_to request_path(@request)
   else
     render :edit
   end
end

def destroy
  @request = Request.find(params[:id])
  @request.destroy
  redirect_to requests_path
end

def done
  request = Request.find(params[:id])
  if request.done
    request.update_attribute(:done, false)
  else
    request.update_attribute(:done, true)
  end
  redirect_to requests_path

end

private
#request_params method used for defining params in create and update
def request_params
  params.require(:request).permit([:name, :email, :department, :message])
end

end
