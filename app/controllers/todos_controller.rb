class TodosController < ApplicationController
    before_action :set_todo, only: ['show', 'edit', 'update', 'destroy']

    def new
        @todo = Todo.new;
    end

    def create
        @todo = Todo.new(require_permit)
        if @todo.save
            flash[:notice] = "New Todo created successfully"
            redirect_to todo_url(@todo)
        else
            render 'new'
        end
    end

    def index
        @todos = Todo.all
    end

    def show
    end

    def edit
    end

    def update
        if @todo.update(require_permit)
            flash[:notice] = "Edited Successfully"
            redirect_to todo_path(@todo)
        else
            render 'edit'
        end
    end

    def destroy
        @todo.delete
        flash[:notice] = "Deleted Successfully"
        redirect_to todos_path
    end

    private

        def set_todo
            @todo = Todo.find(params[:id])
        end
        def require_permit
            params.require(:todo).permit(:name, :description);
        end
end