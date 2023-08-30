class KanbanColumnsController < ApplicationController
  before_action :set_kanban_column, only: %i[ show edit update destroy ]

  # GET /kanban_columns or /kanban_columns.json
  def index
    @kanban_columns = KanbanColumn.all
  end

  # GET /kanban_columns/1 or /kanban_columns/1.json
  def show
  end

  # GET /kanban_columns/new
  def new
    @kanban_column = KanbanColumn.new
  end

  # GET /kanban_columns/1/edit
  def edit
  end

  # POST /kanban_columns or /kanban_columns.json
  def create
    @kanban_column = KanbanColumn.new(kanban_column_params)

    respond_to do |format|
      if @kanban_column.save
        format.html { redirect_to kanban_column_url(@kanban_column), notice: "Kanban column was successfully created." }
        format.json { render :show, status: :created, location: @kanban_column }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kanban_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kanban_columns/1 or /kanban_columns/1.json
  def update
    respond_to do |format|
      if @kanban_column.update(kanban_column_params)
        format.html { redirect_to kanban_column_url(@kanban_column), notice: "Kanban column was successfully updated." }
        format.json { render :show, status: :ok, location: @kanban_column }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kanban_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kanban_columns/1 or /kanban_columns/1.json
  def destroy
    @kanban_column.destroy

    respond_to do |format|
      format.html { redirect_to kanban_columns_url, notice: "Kanban column was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kanban_column
      @kanban_column = KanbanColumn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kanban_column_params
      params.require(:kanban_column).permit(:name, :position)
    end
end
