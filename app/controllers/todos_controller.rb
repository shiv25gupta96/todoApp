class TodosController < ApplicationController

    def new
        @any = Todo.new;
    end

    def create
        @any = Todo.new(require_permit)
        if @any.save
            flash[:created] = "New Todo created successfully"
            redirect_to todo_url(@any)
        else
            render 'new'
        end
    end

    def index
        @todos = Todo.all
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def destroy
        @todo = Todo.find(params[:id])
        if @todo.delete
            @todos = Todo.all
            render 'index'
        end
    end

    private
        def require_permit
            params.require(:todo).permit(:name, :description);
        end
end