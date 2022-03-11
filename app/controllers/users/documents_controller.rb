module Users
  class DocumentsController < Users::Base
    before_action :set_document, only: %i[show edit update destroy]

    def index
      @documents = Document.all
    end

    def show
    end

    def new
      @document = Document.new
    end
    
    def create
    end

    def edit
    end

    def update
    end

    def destroy
      
    end

    private
    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:type, :created_on, :submitted_on)
    end
  end
end
