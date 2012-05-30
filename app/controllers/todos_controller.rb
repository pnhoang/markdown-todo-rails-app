class TodosController < ApplicationController
  before_filter :authorize
  layout 'with_links'
  
  # GET /todos
  # GET /todos.json
  def index
    @list = List.find(params[:list_id])
    @todos = @list.todos.paginate(page: params[:page], per_page: 5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @list }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  # GET /todos/new
  # GET /todos/new.json
  def new
    @list = List.find(params[:list_id])
    @todo = @list.todos.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todos/1/edit
  def edit
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])
  end

  # POST /todos
  # POST /todos.json
  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.build(params[:todo])
    
    respond_to do |format|
      if @todo.save
        format.html { redirect_to list_todos_path(@list), notice: 'Todo item was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todos/1
  # PUT /todos/1.json
  def update
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to list_todo_url(@list, @todo), notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
    end
  end
end
