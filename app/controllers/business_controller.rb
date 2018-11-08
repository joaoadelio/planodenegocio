class BusinessController < ApplicationController
    before_action :authenticate_user!
    def index
        @answers = Answer.joins(:question).where('questions.group_id = 2 and user_id = ?', current_user.id)
    end

    def new
        @answer = Answer.new
        @questions = Question.where('group_id = 2')
        @method = 'create'
    end

    def edit
        @business = Answer.joins(:question).where('questions.group_id = 2 and user_id = ?', current_user.id)
        @method = 'update'
    end

    def create
        params[:business][:question].each do |k, v|
            answer = Answer.new
            answer.user_id = params[:business][:user_id]
            answer.question_id = k;
            answer.answer = v;
            answer.save
        end
        respond_to do |format|
            format.html { redirect_to "/business", notice: 'Questionário cadastrado com sucesso.' }
            format.json { render :index, status: :created, location: @answer }
        end
    end

    def update
        params[:business][:answer].each do |k, v|
            answer = Answer.find(k)
            answer.user_id = params[:business][:user_id]
            answer.answer = v;
            answer.save
        end
        respond_to do |format|
            format.html { redirect_to "/business", notice: 'Questionário atualizado com sucesso.' }
            format.json { render :index, status: :created, location: @answer }
        end
    end

    def destroy
        @answers = Answer.joins(:question).where('questions.group_id = 2 and user_id = ?', current_user.id)
        @answers.each do |a|
            a.destroy
        end
        respond_to do |format|
            format.html { redirect_to "/business", notice: 'Questionário excluído com sucesso.' }
            format.json { head :no_content }
        end
    end
end
